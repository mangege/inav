# -*- encoding : utf-8 -*-
require 'remote_test_helper'

class SellerCatTest < RemoteTestCase
  test "::taobao_list_sync 应该正常获取店铺分类数据" do
    seller_cats = SellerCat.taobao_list_sync(default_remote_user)
    assert_not_nil seller_cats.first.tb_name
  end
end
