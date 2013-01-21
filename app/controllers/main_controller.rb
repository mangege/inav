# -*- encoding : utf-8 -*-
class MainController < ApplicationController
  layout 'management'
  skip_before_filter :login_required, only: [:about, :index]

  def index
    if logged_in? && admin_index?
      @shop = current_user.shop
      render 'index'
    else
      render 'home', layout: 'main'
    end
  end

  def about
    render layout: 'main'
  end

  private
  def admin_index?
    params[:front].to_i != 1
  end
end
