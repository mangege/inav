# -*- encoding : utf-8 -*-
module ItemWorker
  module UpdateBase
    def pre_sync
      ShopWorker::Sync.new.process(@user.id)
      SellerCatWorker::Sync.new.process(@user.id)
    end
  end

  class UpdateAll < WorkerBase
    include UpdateBase
    def process(user_id)
      @user = User.find(user_id)
      pre_sync
      ItemWorker::SyncAll.new.process(@user.id)
      @user.items.find_each do |item|
        Item.taobao_desc_update(@user, item)
      end
    end
  end

  class UpdateInventory < WorkerBase
    include UpdateBase
    def process(user_id)
      @user = User.find(user_id)
      pre_sync
      ItemWorker::SyncInventory.new.process(@user.id)
      @user.items.inventory.find_each do |item|
        Item.taobao_desc_update(@user, item)
      end
    end
  end

  class UpdateOnsale < WorkerBase
    include UpdateBase
    def process(user_id)
      @user = User.find(user_id)
      pre_sync
      ItemWorker::SyncOnsale.new.process(@user.id)
      @user.items.onsale.find_each do |item|
        Item.taobao_desc_update(@user, item)
      end
    end
  end

  class SyncAll < WorkerBase
    def process(user_id)
      user = User.find(user_id)
      Item.taobao_onsale_sync(user)
      Item.taobao_inventory_sync(user)
      Item.taobao_desc_sync(user)
    end
  end

  class SyncOnsale < WorkerBase
    def process(user_id)
      user = User.find(user_id)
      Item.taobao_onsale_sync(user)
      Item.taobao_desc_sync(user)
    end
  end

  class SyncInventory < WorkerBase
    def process(user_id)
      user = User.find(user_id)
      Item.taobao_inventory_sync(user)
      Item.taobao_desc_sync(user)
    end
  end
end
