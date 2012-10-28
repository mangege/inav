# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  OAUTH2_ATTS = [:taobao_user_nick, :access_token, :refresh_token,
    :expires_in, :re_expires_in, :r1_expires_in, :r2_expires_in, :w1_expires_in, :w2_expires_in, :oauth2_updated_at]
  attr_accessible(*OAUTH2_ATTS)

  validates :taobao_user_id, :taobao_user_nick, presence: true
  validates :taobao_user_id, uniqueness: true

  def self.find_or_create_by_oauth2(hash)
    hash = hash.with_indifferent_access
    OAUTH2_ATTS.dup.push(:taobao_user_id).each do |key|
      raise(ArgumentError, "oauth2: #{key} 不能为空") if hash[key].nil?
    end
    user = self.find_by_taobao_user_id(hash['taobao_user_id'])
    if user.nil?
      user = self.new
      user.taobao_user_id = hash['taobao_user_id']
    end
    attributes = hash.slice(*OAUTH2_ATTS)
    user.assign_attributes(attributes)
    user.save!
    user
  end
end
