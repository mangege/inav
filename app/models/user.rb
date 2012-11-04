# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  has_one :shop
  has_many :seller_cats

  TAOBAO_KEYS = %w[taobao_user_id taobao_user_nick access_token refresh_token
    expires_in re_expires_in r1_expires_in r2_expires_in w1_expires_in w2_expires_in oauth2_updated_at]
  attr_accessible(*TAOBAO_KEYS, as: :taobao)

  validates :taobao_user_id, :taobao_user_nick, presence: true
  validates :taobao_user_id, uniqueness: true

  def self.find_or_create_by_oauth2(hash)
    hash = hash.with_indifferent_access
    TAOBAO_KEYS.each do |key|
      raise(ArgumentError, "oauth2: #{key} 不能为空") if hash[key].nil?
    end
    user = self.find_by_taobao_user_id(hash['taobao_user_id'])
    if user.nil?
      user = self.new
      user.taobao_user_id = hash['taobao_user_id']
    end
    attributes = hash.slice(*TAOBAO_KEYS)
    user.assign_attributes(attributes, as: :taobao)
    user.save!
    user
  end

  def oauth2_expired?
    oauth2_updated_at + expires_in < Time.now
  end

  def find_or_create_shop
    if shop.nil?
      self.shop = Shop.taobao_shop_get(taobao_user_nick)
      self.shop.save!
    end
    shop
  end

  def seller_cats_with_sync
    #TODO check
    if false
      seller_cats = SellerCat.taobao_sellercats_list_get(taobao_user_nick)
      seller_cats.each do |seller_cat|
        seller_cat.user = self
        seller_cat.save!
      end
    end
    self.seller_cats.parent.include_sub
  end
end
