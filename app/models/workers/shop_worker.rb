module ShopWorker
  class Sync
    include Sidekiq::Worker
    def perform(user_id)
      user = User.find(user_id)
      Shop.taobao_sync(user)
    end
  end
end
