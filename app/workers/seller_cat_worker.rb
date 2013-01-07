# -*- encoding : utf-8 -*-
module SellerCatWorker 
  class Sync < WorkerBase
    def process(user_id)
      user = User.find(user_id)
      User.transaction do
        SellerCat.taobao_list_sync(user)
        user.seller_cats_updated_at = Time.now
        user.save!
      end
    end
  end
end
