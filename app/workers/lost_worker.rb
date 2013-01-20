class LostWorker
  include Sidekiq::Worker

  def perform(begin_time, end_time)
    #type only item
    b = Taobao::Util.to_taobao_time_from_millisecond(begin_time)
    e = Taobao::Util.to_taobao_time_from_millisecond(end_time)
    l_params = {types: 'item', start: b, end: e}

    result_hash = Taobao::Api.taobao_comet_discardinfo_get(l_params)
    result_hash['discard_info_list'].each do |discard_info|
      IncrementWorker::ItemDelete.perform_async(discard_info['nick'], begin_time, end_time)
    end
  rescue
    Util.log_exception($!)
  end
end
