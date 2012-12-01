class SettingsController < ApplicationController
  layout 'management'
  before_filter :find_user_extned

  def show
    @settings = OpenStruct.new(@user_extend.settings)
  end

  private
  def find_user_extned
    @user_extend = current_user.user_extend
  end
end
