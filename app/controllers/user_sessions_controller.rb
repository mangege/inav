# -*- encoding : utf-8 -*-
class UserSessionsController < ApplicationController
  def new
    if session[:user_id].nil?
      redirect_to Taobao::OAuth2.authorize_url
    end
  end

  def callback
    if params[:code].blank?
      Rails.logger.warn("auth, error: #{params[:error]}, error_description: #{params[:error_description]}") if params[:error]
      render :text => "验证失败", :layout => false
    end
    result = Taobao::OAuth2.result(params[:code])
    render :json => result
  end
end
