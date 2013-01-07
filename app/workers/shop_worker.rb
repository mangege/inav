# -*- encoding : utf-8 -*-
module ShopWorker
  class Sync < WorkerBase
    def process(user_id)
      user = User.find(user_id)
      Shop.taobao_sync(user)
    end
  end
end
