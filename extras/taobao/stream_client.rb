module Taobao
  class StreamClient
    attr_reader :http_code, :packet_code
    def initialize
      @params = {app_key: TaobaoConfig.app_key, 
        timestamp: Taobao::Util.now_taobao_time,
        app_secret: TaobaoConfig.app_secret
      }
      Taobao::HttpSign.sign @params

      @http_code = @packet_code = -1
    end

    def execute
      client = HTTPClient.new
      conn = client.post_async(TaobaoConfig.stream_site, @params)
      resp = conn.pop
      @http_code = resp.status
      #TODO check http code, 200 ,400, 403

      packet_io = resp.content
      while true
        @packet = packet_io.readline
        process_packet

        #TODO 104 可能104包不是之前连接上最后的包，所以最好在写代码的时候读到null后才结束
        #TODO 心跳检测,当60秒没心跳应该主动断开重连
        unless packet_ok?
          process_unknown
          break
        end
      end
    end

    private
    def process_packet
      packet_hash = MultiJson.load(@packet)
      @packet_code = packet_hash['packet']['code']

      if packet_ok?
        case @packet_code
        when 200, 201
          Rails.logger.info "#{Process.pid} #{Time.now} #{@packet}"
        when 202
          process_business(packet_hash)
        when 203
          process_lost(packet_hash)
        else
          process_unknown
        end
      end
    end

    #只处理Item Delete
    def process_business(packet_hash)
      notify_item = packet_hash['packet']['msg']['notify_item']
      if notify_item.nil? 
        process_unknown 
        return
      end
      unless %w[ItemDelete ItemPunishDelete].include?(notify_item['status'])
        process_unknown
        return
      end

      item = Item.where(tb_num_iid: notify_item['num_iid']).first
      item.destroy unless item.nil?
    end

    def process_lost(packet_hash)
      begin_time = packet_hash['packet']['msg']['begin']
      end_time = packet_hash['packet']['msg']['end']
      LostWorker.perform_async(begin_time, end_time)
    end

    #http://open.taobao.com/doc/detail.htm?spm=0.0.0.35.Ng47id&id=101208
    def packet_ok?
      @packet_code >= 200
    end

    def process_unknown
      Rails.logger.warn "#@packet\n#{caller.join("\n")}"
      e = RuntimeError.new(@packet)
      ExceptionNotifier::Notifier.background_exception_notification(e).deliver
    end

    def self.execute
      self.new.execute
    end
  end
end
