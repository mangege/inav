# -*- encoding : utf-8 -*-
class MainController < ApplicationController
  layout 'management'

  def index
    @shop = current_user.shop
  end
end
