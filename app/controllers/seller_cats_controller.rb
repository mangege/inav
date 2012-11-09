class SellerCatsController < ApplicationController
  def index
    @seller_cats = current_user.seller_cats_with_sync.taobao_order
  end
end
