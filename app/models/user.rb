# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  has_one :shop
  has_many :seller_cats
  has_many :items

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

  def seller_cats_with_sync(options = {})
    force_sync = options[:force_sync] || false
    if force_sync || seller_cats_updated_at.nil? || seller_cats_updated_at < 6.hour.ago
      remote_seller_cats = SellerCat.taobao_sellercats_list_get(taobao_user_nick)
      db_ids = seller_cats.pluck(:cid)
      remote_ids = remote_seller_cats.map(&:cid)
      intersection_ids = db_ids & remote_ids
      User.transaction do
        delete_ids = db_ids - intersection_ids
        seller_cats.where(cid:  delete_ids).delete_all

        create_ids = remote_ids - intersection_ids
        remote_seller_cats.each do |seller_cat|
          if create_ids.include?(seller_cat.cid)
            seller_cat.user = self
            seller_cat.save!
          end
        end
        self.seller_cats_updated_at = Time.now
        save!
      end
    end
    self.seller_cats.parent_cats.include_sub_seller_cats.taobao_order
  end

  def items_with_sync
    #TODO check
    if true
      num_iids = []
      num_iids.concat( Item.taobao_items_onsale_get(access_token) )
      num_iids.concat( Item.taobao_items_inventory_get(access_token) )
      items = Item.taobao_items_list_get(num_iids)
      items.each do |item|
        item.user_id = id
        item.save!
      end
    end
    self.items
  end
end
