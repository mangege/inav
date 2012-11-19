# -*- encoding : utf-8 -*-
class MainController < ApplicationController
  def index
    #TODO 定时更新,手动更新
    @shop = current_user.find_or_create_shop
  end
end
