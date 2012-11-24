# -*- encoding : utf-8 -*-
require 'remote_test_helper'

class ShopTest < RemoteTestCase
  test "::taobao_shop_get 应该获取店铺数据" do
    shop = Shop.taobao_sync(default_remote_user)
    assert_not_nil shop.tb_title
  end
end
