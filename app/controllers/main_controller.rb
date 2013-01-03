# -*- encoding : utf-8 -*-
class MainController < ApplicationController
  layout 'management'

  def index
    if current_user.shop.nil? || current_user.shop.taobao_expired?
      @shop = Shop.taobao_sync(current_user)
    else
      @shop = current_user.shop
    end
  end
end
