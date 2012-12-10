# -*- encoding : utf-8 -*-
class SellerCat < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent_seller_cat, primary_key: :tb_cid, foreign_key: :tb_parent_cid, class_name: :SellerCat
  has_many :sub_seller_cats, primary_key: :tb_cid, foreign_key: :tb_parent_cid, class_name: :SellerCat, dependent: :destroy
  validates :user_id, :tb_cid, :tb_name, :tb_parent_cid, presence: true
  validates :tb_cid, uniqueness: true

  scope :parent_cats, where(tb_parent_cid: 0)
  scope :sub_cats, where('tb_parent_cid <> 0')
  scope :include_sub_seller_cats, includes(:sub_seller_cats)
  scope :taobao_order, order('tb_sort_order ASC') #TODO sort_order等于0貌似不需要显示

  def parent?
    tb_parent_cid == 0
  end

  def sub?
    not parent?
  end

  def seller_cat_url(options = {})
    l_user = options[:user] || user
    shop = l_user.shop
    "#{shop.shop_url}/search.htm?scid=#{tb_cid}"
  end

  def seller_cat_link(options = {})
    l_user = options[:user] || user
    Link.new(tb_name, seller_cat_url(user: l_user))
  end

  def full_links(options = {})
    l_user = options[:user] || user
    links = []
    links << self.parent_seller_cat.seller_cat_link(user: l_user) if sub?
    links << self.seller_cat_link(user: l_user)
    links
  end

  def self.update_priorities(id_priorities, user)
    priority_ids = {}
    id_priorities.each do |id, priority|
      key = priority.to_i
      priority_ids[key] ||= Set.new
      priority_ids[key] << id
    end
    priority_ids.each do |priority, ids|
      user.seller_cats.where(id: ids.to_a).update_all(priority: priority)
    end
  end

  def self.max_by_priority(seller_cats)
    seller_cats.max_by{|s| s.priority}
  end

  def self.taobao_list_sync(user)
    params = {}
    params[:fields] = taobao_fields.join(',')
    params[:nick] = user.taobao_user_nick
    result_hash = Taobao::Api.taobao_sellercats_list_get(params)

    db_ids = user.seller_cats.pluck(:tb_cid)
    taobao_ids = result_hash['seller_cats'].map{|a| a['cid']}
    deleted_ids = db_ids - taobao_ids
    update_ids = db_ids & taobao_ids
    create_ids = taobao_ids - update_ids
    self.transaction do
      user.seller_cats.where(tb_cid: deleted_ids).delete_all
      result_hash['seller_cats'].each do |taobao_attrs|
        cid = taobao_attrs['cid']
        if update_ids.include?(cid)
          taobao_db_update(taobao_attrs)
        elsif create_ids.include?(cid)
          taobao_db_create(taobao_attrs, user)
        end
      end
    end
    user.seller_cats
  end

  def self.taobao_db_update(taobao_attrs)
    seller_cat = self.find_by_tb_cid(taobao_attrs['cid'])
    seller_cat.assign_taobao_attrs(taobao_attrs)
    seller_cat.save!
    seller_cat
  end

  def self.taobao_db_create(taobao_attrs, user)
    seller_cat = self.new
    seller_cat.user = user
    seller_cat.assign_taobao_attrs(taobao_attrs)
    seller_cat.save!
    seller_cat
  end
end
