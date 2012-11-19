# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  belongs_to :user
  TAOBAO_KEYS = %w[detail_url num_iid title desc seller_cids approve_status modified created]
  TAOBAO_ACCESSIBLE_KEYS = TAOBAO_KEYS.dup.tap{|t| t.delete 'desc'; t.push 'item_desc'}
  attr_accessible(*TAOBAO_ACCESSIBLE_KEYS, as: :taobao)
  validates :user_id, :detail_url, :num_iid, :title, :item_desc, :approve_status, presence: true
  #TODO  商品描述. 字数要大于5个字符，小于25000个字

  extend Enumerize
  enumerize :approve_status, in: [:onsale, :instock]

  def  breadcrumbs_html
    #TODO
    'hello kitty'
  end

  def add_breadcrumbs_to_desc
    self.item_desc = "#{breadcrumbs_html}#{item_desc}"
  end

  #TODO 分页
  def self.taobao_items_onsale_get(access_token)
    params = {}
    params[:method] = 'taobao.items.onsale.get'
    params[:session] = access_token
    params[:fields] = 'num_iid'
    params[:page_size] = 200

    result_hash = Taobao::Client.execute(params)
    result_hash['items']['item'].map{|item_hash| item_hash['num_iid']}
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
        item_hash['item_desc'] = item_hash.delete('desc')
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
    params[:desc] = item.item_desc
    result_hash = Taobao::Client.execute(params)
    #TODO 返回modified,修改item modified和item_desc
    result_hash['item']
  end
end
