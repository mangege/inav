# -*- encoding : utf-8 -*-
module ItemWorker
  class UpdateOnsale < WorkerBase
    def process(user_id)
      @user = User.find(user_id)

      sync_seller_cats
      sync_onsale
      sync_desc
      update_onsale_desc
    end

    private
    def sync_seller_cats
      SellerCat.taobao_list_sync(@user)
    end

    def sync_onsale
      Item.taobao_onsale_sync(@user)
    end

    def sync_desc
      Item.taobao_desc_sync(@user)
    end

    def update_onsale_desc
      @user.items.onsale.find_each do |item|
        Item.taobao_desc_update(@user, item)
      end
    end
  end
end
