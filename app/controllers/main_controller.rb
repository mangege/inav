# -*- encoding : utf-8 -*-
class MainController < ApplicationController
  def index
    @shop = Shop.taobao_sync(current_user)
  end
end
