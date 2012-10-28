# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seller_cat do
    cat_type "MyString"
    cid 1
    parent_cid 1
    name "MyString"
    pic_url "MyString"
    sort_order 1
    priority 1
    user
  end
end
