# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    detail_url "MyString"
    num_iid 1
    title "MyString"
    item_desc ""
    seller_cids "MyString"
  end
end
