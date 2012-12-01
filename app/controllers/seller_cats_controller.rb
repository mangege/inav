# -*- encoding : utf-8 -*-
class SellerCatsController < ApplicationController
  layout 'management'

  def index
    force_sync = params[:force_sync] == 'true'
    @seller_cats = current_user.seller_cats_with_sync(force_sync: force_sync)
    flash.now.notice = "同步你的淘宝店铺分类成功" if force_sync
  end

  def update_priorities
    SellerCat.update_priorities(params[:priorities], current_user) if params[:priorities].is_a?(Hash)
    flash.notice = "更新成功"
    redirect_to action: :index
  end
end
