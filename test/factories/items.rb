# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    tb_seller_cids "1"
    tb_approve_status :onsale
    tb_modified { Time.now }
    sequence(:tb_num_iid)
    sequence(:tb_title) {|i| "Item Title #{i}"}
    user
  end
end
