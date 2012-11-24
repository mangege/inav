# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shop do
    tb_sid 1
    tb_cid 1
    tb_title "MyString"
    tb_desc "MyString"
    tb_bulletin "MyString"
    tb_pic_path "MyString"
    tb_created "2012-10-28 23:16:01"
    tb_modified "2012-10-28 23:16:01"
    user
  end
end
