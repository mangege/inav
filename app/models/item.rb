# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  AREA_SELECTOR = "inav"
  belongs_to :user
  has_one :item_desc, dependent: :destroy, autosave: true
  validates :user_id, :tb_num_iid, :tb_title, :tb_approve_status, presence: true

  scope :desc_expired, where('desc_modified IS NULL OR desc_modified < tb_modified')
  scope :onsale, where(tb_approve_status: :onsale)
  scope :instock, where(tb_approve_status: :instock)
  scope :inventory, where(tb_approve_status: :instock)

  extend Enumerize
  enumerize :tb_approve_status, in: %w[onsale instock]

  def tb_desc
    item_desc.try(:content)
  end
  def tb_desc=(desc_content)
    self.item_desc || build_item_desc
    self.item_desc.content = desc_content
  end

  def item_url
    "http://item.taobao.com/item.htm?id=#{tb_num_iid}"
  end

  def item_link
    Link.new(tb_title, item_url)
  end

  def new_desc
    raise "描述已经过期" if desc_expired?
    doc = Nokogiri::HTML.fragment(tb_desc, 'UTF-8')
    a_elem = doc.at_css("div > a[name=#{AREA_SELECTOR}]")
    if a_elem
      a_elem.parent.replace(area_html)
      doc.to_html
    else
      area_html << tb_desc
    end
  end

  def detail_url
    "http://item.taobao.com/item.htm?id=#{tb_num_iid}"
  end

  def related_cat_html
    l_user = self.user
    template = l_user.user_extend.related_cat_liquid_template
    cat  = high_priority_cat
    return '' if cat.nil?

    links = cat.related_cat_full_links
    return '' if links.empty?
    template.render('links' => links)
  end

  def breadcrumb_html
    l_user = self.user
    template = l_user.user_extend.bread_crumb_liquid_template
    links = breadcrumb_links
    if links.empty?
      ''
    else
      template.render('links' => links)
    end
  end

  def breadcrumb_links
    l_user = self.user
    shop = l_user.shop
    user_extend = l_user.user_extend

    links = []
    links << shop.shop_link if user_extend.show_shop_title?
    links.concat(high_priority_breadcrumb_link)
    links << self.item_link if user_extend.show_item_title?
    links
  end

  def high_priority_breadcrumb_link
    seller_cat = high_priority_cat
    seller_cat.nil? ? [] : seller_cat.breadcrumb_full_links
  end

  def high_priority_cat
    l_cids = cids
    return if l_cids.nil?
    seller_cats = SellerCat.where(tb_cid: l_cids)
    if seller_cats.size > 1
      SellerCat.max_by_priority(seller_cats)
    else
      seller_cats.first
    end
  end

  def cids
    cids = tb_seller_cids.split(',')
    cids.delete('')
    cids.delete('-1')
    cids
  end

  def desc_expired?
    desc_modified.nil? || desc_modified < tb_modified
  end

  def self.taobao_columns
    columns = super << 'tb_desc'
    yield columns if block_given?
    columns
  end

  #sync_type: one, all
  def self.taobao_onsale_sync(user, options = {})
    taobao_list_sync(:onsale, user, options)
  end

  #sync_type: one, all
  def self.taobao_inventory_sync(user, options = {})
    taobao_list_sync(:inventory, user, options)
  end

  def self.taobao_desc_sync(user, options = {})
    sync_type = options[:sync_type] || :all
    params = {}
    params[:fields] = 'num_iid, desc, modified'

    num_iids = nil
    if sync_type == :one
      num_iids = user.items.desc_expired.limit(1).pluck(:tb_num_iid)
    else
      num_iids = user.items.desc_expired.pluck(:tb_num_iid)
    end
    num_iids.each_slice(20) do |batch_num_iids|
      params[:num_iids] = batch_num_iids.join(',')
      result_hash = Taobao::Api.taobao_items_list_get(params)
      result_hash['items'].each do |taobao_attrs|
        taobao_db_update_desc(taobao_attrs)
      end
    end

    user.items
  end

  def self.taobao_desc_update(user, item)
    params = {}
    params[:session] = user.access_token
    params[:num_iid] = item.tb_num_iid
    params[:desc] = item.new_desc

    result_hash = Taobao::Api.taobao_item_update(params)
    taobao_db_update_new_desc(item, params[:desc], result_hash['item'])
  end

  def self.taobao_db_update_or_create(taobao_attrs, user)
    item = find_or_initialize_by_tb_num_iid(taobao_attrs['num_iid'])
    item.assign_taobao_attrs(taobao_attrs)
    item.user = user
    item.save!
    item
  end

  def self.taobao_db_update_desc(taobao_attrs)
    desc_modified = taobao_attrs['modified']
    item = find_by_tb_num_iid(taobao_attrs['num_iid'])
    item.desc_modified = desc_modified
    item.tb_desc = taobao_attrs['desc']
    item.save!
  end

  def self.taobao_db_update_new_desc(item, p_new_desc, taobao_attrs)
    item.desc_modified = taobao_attrs['modified']
    item.tb_desc = p_new_desc
    item.save!
  end

  def self.taobao_has_next?(result_hash, sync_type, params)
    result_hash.nil? || ( sync_type == :all && (params[:page_no]*params[:page_size] < result_hash['total_results']) )
  end

  def self.taobao_list_sync(list_type, user, options = {})
    sync_type = options[:sync_type] || :all
    api_method = list_type == :onsale ? :taobao_items_onsale_get : :taobao_items_inventory_get

    params = {}
    params[:session] = user.access_token
    params[:fields] = Item.taobao_fields.tap{|f|f.delete 'desc'}.join(',')
    params[:page_no] = 1
    params[:page_size] = 200

    params[:page_size] = 1 if sync_type == :one

    result_hash = nil
    while taobao_has_next?(result_hash, sync_type, params)
      params[:page_no] += 1 unless result_hash.nil?
      result_hash = Taobao::Api.send(api_method, params)
      result_hash['items'].each do |taobao_attrs|
        taobao_db_update_or_create(taobao_attrs, user) #TODO 删除通过update接口报错处理实现,以后改成主动通知实现
      end
    end

    user.items
  end
  private_class_method :taobao_has_next?, :taobao_list_sync

  private
  def area_html
    html = ""
    html << "<div><a name=\"#{AREA_SELECTOR}\"></a>"

    html << breadcrumb_html
    html << related_cat_html

    html << '</div>'
  end
end
