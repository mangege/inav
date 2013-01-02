# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :back_task do
    task_status "MyString"
    task_type "MyString"
    job_id "MyString"
    user_id 1
  end
end
