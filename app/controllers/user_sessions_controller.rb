# -*- encoding : utf-8 -*-
require 'taobao/oauth2'
class UserSessionsController < ApplicationController
  skip_before_filter :login_required
  layout 'main'

  def new
    if session[:user_id].nil?
      redirect_to Taobao::OAuth2.authorize_url
    else
      redirect_to '/'
    end
  end

  def callback
    if params[:code].blank?
      Rails.logger.warn("auth, error: #{params[:error]}, error_description: #{params[:error_description]}") if params[:error]
      @msg = "登录失败"
      render 'not_login'
      return
    end
    result = Taobao::OAuth2.result(params[:code])
    user = User.find_or_create_by_oauth2(result)
    login_user(user)
    redirect_back_or_default
  end

  def not_login
    if logged_in?
      redirect_to '/'
    else
      @msg = '用户没有登录'
      render 'not_login'
    end
  end

  def oauth2_expired
    logout_user
    @msg = '登录已经过期'
    render 'not_login'
  end
end
