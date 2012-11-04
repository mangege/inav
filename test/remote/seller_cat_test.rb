# -*- encoding : utf-8 -*-
require 'test_helper'

class SellerCatTest < ActiveSupport::TestCase
  test "::taobao_sellercats_list_get 应该正常获取店铺分类数据" do
    seller_cats = SellerCat.taobao_sellercats_list_get(default_remote_user_attrs['taobao_user_nick'])
    assert_not_nil seller_cats.first.name
  end
end
