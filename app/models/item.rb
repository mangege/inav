# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  belongs_to :user
  has_one :item_desc, dependent: :destroy, autosave: true
  validates :user_id, :tb_num_iid, :tb_title, :tb_approve_status, presence: true

  scope :desc_expired, where('desc_modified IS NULL OR desc_modified < tb_modified')

  extend Enumerize
  enumerize :tb_approve_status, in: {onsale: 0, instock: 1}

  def tb_desc
    item_desc.try(:content)
  end
  def tb_desc=(desc_content)
    self.item_desc || build_item_desc
    self.item_desc.content = desc_content
  end

  def detail_url
    "http://item.taobao.com/item.htm?id=#{tb_num_iid}"
  end

  def breadcrumbs_html
    #TODO
    'hello kitty'
  end

  def add_breadcrumbs_to_desc
    self.content = "#{breadcrumbs_html}#{content}"
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

  def self.taobao_item_update(access_token, item)
    params = {}
    params[:method] = 'taobao.item.update'
    params[:session] = access_token

    params[:num_iid] = item.num_iid
    params[:desc] = item.content
    result_hash = Taobao::Client.execute(params)
    #TODO 返回modified,修改item modified和content
    result_hash['item']
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
    unless item.nil?
      item.desc_modified = desc_modified
      item.tb_desc = taobao_attrs['desc']
      item.save!
    end
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
end
