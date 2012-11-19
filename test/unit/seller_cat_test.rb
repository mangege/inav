# -*- encoding : utf-8 -*-
require 'test_helper'

class SellerCatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "TAOBAO_ACCESSIBLE_KEY 应该没有type" do
    assert SellerCat::TAOBAO_KEYS.include?('type')
    assert !SellerCat::TAOBAO_ACCESSIBLE_KEYS.include?('type')
    
    assert !SellerCat::TAOBAO_KEYS.include?('cat_type')
    assert SellerCat::TAOBAO_ACCESSIBLE_KEYS.include?('cat_type')
  end

  test "::taobao_sellercats_list_get 应该返回一个SellerCat数组" do
    body = <<-EOS
{
    "sellercats_list_get_response": {
        "seller_cats": {
            "seller_cat": [{
                "cid": 12345,
                "parent_cid": 12,
                "name": "自定义类型名称",
                "pic_url": "xva1sdfxxx.jpg",
                "sort_order": 1,
                "type": "manual_type"
            }]
        }
    }
}
    EOS
    stub_api_get(body)
    seller_cats = SellerCat.taobao_sellercats_list_get('kitty')
    assert seller_cats.is_a?(Array)
    body_hash = MultiJson.load(body)
    seller_cat = seller_cats.first
    SellerCat::TAOBAO_KEYS.each do |key|
      if key == 'type'
        assert_not_nil seller_cat.cat_type, key
        assert_equal seller_cat.cat_type, body_hash['sellercats_list_get_response']['seller_cats']['seller_cat'][0][key]
      else
        assert_not_nil seller_cat.send(key), key
        assert_equal seller_cat.send(key), body_hash['sellercats_list_get_response']['seller_cats']['seller_cat'][0][key]
      end
    end
  end

  test "#parent? parent_id为0则是父分类,否则应该是子分类" do
    seller_cat = FactoryGirl.build(:seller_cat)
    assert seller_cat.parent?
    assert !seller_cat.sub?

    seller_cat.parent_cid = 1
    assert !seller_cat.parent?
    assert seller_cat.sub?
  end

  test "#update_priorities 应该更新对应记录的优先级" do
    seller_cat = FactoryGirl.create(:seller_cat)

    assert_equal 0, seller_cat.priority
    SellerCat.update_priorities({seller_cat.id => 1}, seller_cat.user)
    seller_cat.reload
    assert_equal 1, seller_cat.priority
  end

  test "#update_priorities 多条记录应该都更新成功" do
    user = FactoryGirl.create(:user)
    seller_cats = FactoryGirl.create_list(:seller_cat, 3, user: user)

    assert_equal [0]*3, seller_cats.map(&:priority)
    id_priorities = {}
    one = seller_cats[0..1]
    two = seller_cats[2..-1]
    one.each{|seller_cat| id_priorities[seller_cat.id] = 1}
    two.each{|seller_cat| id_priorities[seller_cat.id] = 2}
    
    SellerCat.update_priorities(id_priorities, user)
    one.each do |seller_cat|
      seller_cat.reload
      assert_equal 1, seller_cat.priority
    end
    two.each do |seller_cat|
      seller_cat.reload
      assert_equal 2, seller_cat.priority
    end
  end

  test "#update_priorities 只更新用户对应的记录,忽略非当前用户的更新" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    seller_cat = FactoryGirl.create(:seller_cat, user: user)
    seller_cat2 = FactoryGirl.create(:seller_cat, user: user2)

    assert_equal 0, seller_cat.priority
    assert_equal 0, seller_cat2.priority

    SellerCat.update_priorities({seller_cat.id => 1, seller_cat2.id => 1}, user)
    seller_cat.reload
    seller_cat2.reload
    assert_equal 1, seller_cat.priority
    assert_equal 0, seller_cat2.priority
  end
end
