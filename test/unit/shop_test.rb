# -*- encoding : utf-8 -*-
require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "#shop_url shop+sid.taobao.com即店铺地址" do
    shop = FactoryGirl.build(:shop, tb_sid: 123456)
    assert_equal 'http://shop123456.taobao.com', shop.shop_url
  end

  test "::taobao_sync 值应该正确" do
    body = <<-EOS
{
    "shop_get_response": {
        "shop": {
            "sid": 44750468,
            "cid": 123456,
            "nick": "csuky",
            "title": "我的店铺",
            "desc": "我的店铺的描述",
            "bulletin": "我的店铺的公告",
            "pic_path": "/e2/c0/T1KVXXXhGvt0L1upjX.jpg",
            "created": "2000-01-01 00:00:00",
            "modified": "2000-01-01 00:00:00",
            "shop_score": {
                "item_score": 60,
                "service_score": 100,
                "delivery_score": 90
            }
        }
    }
}
    EOS
    stub_api_get(body)
    user = FactoryGirl.create(:user, taobao_user_nick: 'csuky')
    shop = nil
    assert_nil user.shop
    assert_difference "Shop.count" do
      shop = Shop.taobao_sync(user)
    end
    user.reload
    assert_not_nil user.shop

    body_hash = MultiJson.load(body)
    columns = Shop.taobao_columns
    columns.delete('tb_modified')
    columns.delete('tb_created')
    columns.each do |field|
      assert_not_nil shop.send(field), field
      assert_equal shop.send(field), body_hash['shop_get_response']['shop'][field[3..-1]]
    end
  end
end
