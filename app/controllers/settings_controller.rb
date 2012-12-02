# -*- encoding : utf-8 -*-
class SettingsController < ApplicationController
  layout 'management'
  before_filter :find_user_extned

  def show
    @settings = OpenStruct.new( @user_extend.settings )
  end

  def update
    @user_extend.settings = settings_params
    @user_extend.save!
    flash.notice = "设置保存成功"
    redirect_to action: :show
  end

  private
  def find_user_extned
    @user_extend = current_user.user_extend
  end

  def settings_params
    settings = params[:settings]
    settings = {} unless settings.is_a?(Hash)
    settings
  end
end
