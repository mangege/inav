# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    detail_url "http://item.taobao.com/item.htm?spm=0.0.0.91.BAHxzH&id=20546764994"
    seller_cids "1"
    approve_status :onsale
    modified { Time.now }
    sequence(:num_iid)
    sequence(:title) {|i| "Item Title #{i}"}
    user
  end
end
