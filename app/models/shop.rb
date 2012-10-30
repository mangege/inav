# -*- encoding : utf-8 -*-
class Shop < ActiveRecord::Base
  belongs_to :user
  TAOBAO_KEYS = %w[bulletin cid created desc modified pic_path sid title]
  attr_accessible(*TAOBAO_KEYS, as: :taobao)
  validates :sid, :title, :user_id, presence: true
  validates :user_id, uniqueness: true

  def shop_url
    "http://shop#{sid}.taobao.com"
  end

  def self.taobao_shop_get(nick)
    params = {}
    params[:method] = 'taobao.shop.get'
    params[:fields] = 'sid,cid,title,desc,bulletin,pic_path,created,modified'
    params[:nick] = nick
    result_hash = Taobao::Client.execute(params)

    shop = Shop.new
    shop.assign_attributes( result_hash['shop'].slice(*TAOBAO_KEYS) ,as: :taobao)
    shop
  end
end
