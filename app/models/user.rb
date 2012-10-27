# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :taobao_user_nick, :access_token, :refresh_token,
    :expires_in, :re_expires_in, :r1_expires_in, :r2_expires_in, :w1_expires_in, :w2_expires_in

  validates :taobao_user_id, :taobao_user_nick, presence: true
  validates :taobao_user_id, uniqueness: true

  def self.find_or_create_by_oauth2(hash)
    hash = hash.with_indifferent_access
    raise(ArgumentError, "taobao_user_id 不能为空") unless hash.key?(:taobao_user_id)
    user = self.find_by_taobao_user_id(hash['taobao_user_id'])
    if user.nil?
      user = self.new
      user.taobao_user_id = hash['taobao_user_id']
    end
    attributes = hash.slice(:taobao_user_nick, :access_token, :refresh_token,
                            :expires_in, :re_expires_in, :r1_expires_in, :r2_expires_in, :w1_expires_in, :w2_expires_in)
    user.assign_attributes(attributes)
    user.save!
    user
  end
end
