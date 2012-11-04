# -*- encoding : utf-8 -*-
require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  test "::taobao_shop_get 应该获取店铺数据" do
    shop = Shop.taobao_shop_get(default_remote_user_attrs['taobao_user_nick'])
    assert_not_nil shop.title
  end
end
