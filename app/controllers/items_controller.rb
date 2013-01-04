# -*- encoding : utf-8 -*-
class ItemsController < ApplicationController
  layout 'management'

  def index
    @items = current_user.items
  end
end
