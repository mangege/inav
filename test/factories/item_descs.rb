# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item_desc do
    item_id { FactoryGirl.create(:item).id }
    content 'desc content'
  end
end
