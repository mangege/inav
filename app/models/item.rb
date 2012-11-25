# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  belongs_to :user
  has_one :item_desc, dependent: :destroy, autosave: true
  validates :user_id, :tb_num_iid, :tb_title, :tb_approve_status, presence: true

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
    sync_type = options[:sync_type] || :all

    params = {}
    params[:session] = user.access_token
    params[:fields] = Item.taobao_fields.tap{|f|f.delete 'desc'}.join(',')
    params[:page_no] = 1
    params[:page_size] = 200

    params[:page_size] = 1 if sync_type == :one

    result_hash = nil
    while taobao_has_next?(result_hash, sync_type, params)
      params[:page_no] += 1 unless result_hash.nil?
      result_hash = Taobao::Api.taobao_items_onsale_get(params)
      result_hash['items'].each do |taobao_attrs|
        taobao_db_update_or_create(taobao_attrs, user) #TODO 删除通过update接口报错处理实现,以后改成主动通知实现
      end
    end

    user.items
  end

  def self.taobao_items_inventory_get(access_token)
    params = {}
    params[:method] = 'taobao.items.inventory.get'
    params[:session] = access_token
    params[:fields] = 'num_iid'
    params[:page_size] = 200

    result_hash = Taobao::Client.execute(params)
    num_iids = []
    num_iids = result_hash['items']['item'].map{|item_hash| item_hash['num_iid']} if result_hash['items']
    num_iids
  end

  def self.taobao_items_list_get(num_iids)
    params = {}
    params[:method] = 'taobao.items.list.get'
    params[:fields] = TAOBAO_KEYS.join(',')

    items = []
    num_iids.each_slice(20) do |batch_num_iids|
      params[:num_iids] = batch_num_iids.join(',')
      result_hash = Taobao::Client.execute(params)
      result_hash['items']['item'].each do |item_hash|
        item_hash['content'] = item_hash.delete('desc')
        item = self.new
        item.assign_attributes( item_hash.slice(*TAOBAO_ACCESSIBLE_KEYS), as: :taobao )
        items << item
      end if result_hash['items']
    end
    items
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

  def self.taobao_has_next?(result_hash, sync_type, params)
    result_hash.nil? || ( sync_type == :all && (params[:page_no]*params[:page_size] < result_hash['total_results']) )
  end
end
