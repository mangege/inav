# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    tb_detail_url "http://item.taobao.com/item.htm?spm=0.0.0.91.BAHxzH&id=20546764994"
    tb_seller_cids "1"
    tb_approve_status :onsale
    tb_modified { Time.now }
    sequence(:tb_num_iid)
    sequence(:tb_title) {|i| "Item Title #{i}"}
    user
  end
end
