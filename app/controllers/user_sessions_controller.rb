# -*- encoding : utf-8 -*-
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
    return unless check_seller_and_sync_shop
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

  private
  #有异常则返回false
  def check_seller_and_sync_shop(user)
    if user.shop.nil?
      Shop.taobao_sync(current_user)
    end
    true
  rescue ResponseError
    if $!.sub_code == "isv.invalid-parameter:user-without-shop"
      @msg = "对不起,你的帐号没有开通店铺,无法为你服务,请使用你的店铺帐号登录"
      render 'not_login'
      false
    else
      raise $!
    end
  end
end
