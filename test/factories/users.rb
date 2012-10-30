# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :taobao_user_id 
    sequence(:taobao_user_nick){|n| "name#{n}"}
  end
end
