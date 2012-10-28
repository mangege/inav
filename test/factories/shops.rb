# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shop do
    sid 1
    cid 1
    title "MyString"
    desc "MyString"
    bulletin "MyString"
    pic_path "MyString"
    created "2012-10-28 23:16:01"
    modified "2012-10-28 23:16:01"
    user
  end
end
