# -*- encoding : utf-8 -*-
class UserExtend < ActiveRecord::Base
  belongs_to :user
  serialize :settings, Hash

  def settings
    read_attribute(:settings) || {}
  end
end
