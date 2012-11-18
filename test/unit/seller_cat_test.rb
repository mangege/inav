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
end
