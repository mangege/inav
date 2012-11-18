# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seller_cat do
    sequence(:cid)
    parent_cid 0
    sequence(:name) {|n | "cat name #{n}"}
    user
  end

  factory :sub_seller_cat, parent: :seller_cat do
    association :parent_seller_cat, factory: :seller_cat
  end
end
