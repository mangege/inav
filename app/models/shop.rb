# -*- encoding : utf-8 -*-
class Shop < ActiveRecord::Base
  belongs_to :user
  validates :tb_sid, :tb_title, :user_id, presence: true
  validates :user_id, uniqueness: true

  def shop_url
    "http://shop#{tb_sid}.taobao.com"
  end

  def shop_link
    Link.new(tb_title, shop_url)
  end

  #TODO 6小时更新一次
  def self.taobao_sync(user)
    params = {}
    params[:fields] = taobao_fields.join(',')
    params[:nick] = user.taobao_user_nick
    result_hash = Taobao::Api.taobao_shop_get(params)
    taobao_db_update_or_create(result_hash['shop'], user)
  end

  def self.taobao_db_update_or_create(taobao_attrs, user)
    shop = find_or_initialize_by_tb_sid(taobao_attrs['sid'])
    shop.assign_taobao_attrs(taobao_attrs)
    shop.user = user
    shop.save!
    shop
  end
end
