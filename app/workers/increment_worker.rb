module IncrementWorker
  class ItemDelete
    include Sidekiq::Worker

    def perform(nick, begin_time, end_time)
      #TODO ItemPunishDelete process
      b = Taobao::Util.to_taobao_time_from_millisecond(begin_time)
      e = Taobao::Util.to_taobao_time_from_millisecond(end_time)
      l_params = {status: 'ItemDelete', start_modified: b, end_modified: e, nick: nick}
      l_params[:page_no] = 1 #TODO page data
      l_params[:page_size] = 200

      result_hash = Taobao::Api.taobao_increment_items_get(l_params)
      result_hash['notify_items'].each do |notify_item|
        item = Item.where(tb_num_iid: notify_item['num_iid']).first
        item.destroy unless item.nil?
      end
    rescue
      ExceptionNotifier::Notifier.background_exception_notification($!).deliver
    end
  end
end
