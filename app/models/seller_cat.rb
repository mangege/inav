# -*- encoding : utf-8 -*-
class SellerCat < ActiveRecord::Base
  belongs_to :user
  TAOBAO_KEYS = %w[type cid parent_cid name pic_url sort_order]
  TAOBAO_ACCESSIBLE_KEYS = TAOBAO_KEYS.dup.tap{|t| t.delete 'type'; t.push 'cat_type'}
  attr_accessible(*TAOBAO_ACCESSIBLE_KEYS, as: :taobao)
  validates :user_id, :cid, :name, :parent_cid, presence: true
  validates :cid, uniqueness: true
  has_many :sub_seller_cats, primary_key: :cid, foreign_key: :parent_cid, class_name: :SellerCat

  scope :parent_cats, where(parent_cid: 0)
  scope :sub_cats, where('parent_cid <> 0')
  scope :include_sub_seller_cats, includes(:sub_seller_cats)
  scope :taobao_order, order('sort_order ASC') #TODO sort_order等于0貌似不需要显示
  #TODO priority 默认值

  def self.taobao_sellercats_list_get(nick)
    params = {}
    params[:method] = 'taobao.sellercats.list.get'
    params[:fields] = TAOBAO_KEYS.join(',')
    params[:nick] = nick

    result_hash = Taobao::Client.execute(params)
    seller_cats = []
    result_hash['seller_cats']['seller_cat'].each do |cat_hash|
      cat_hash['cat_type'] = cat_hash.delete('type')
      seller_cat = self.new
      seller_cat.assign_attributes( cat_hash.slice(*TAOBAO_ACCESSIBLE_KEYS), as: :taobao )
      seller_cats << seller_cat
    end
    seller_cats
  end
end
