# -*- encoding : utf-8 -*-
class MainController < ApplicationController
  layout 'management'
  skip_before_filter :login_required, only: [:about]
  caches_page :about

  def index
    @shop = current_user.shop
  end

  def about
    render layout: 'main'
  end
end
