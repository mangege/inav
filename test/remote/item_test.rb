# -*- encoding : utf-8 -*-
require 'remote_test_helper'

class ItemTest < RemoteTestCase
  test "::taobao_onsale_sync 应该不报错" do
    assert_nothing_raised do
      Item.taobao_onsale_sync(default_remote_user)
    end
  end

  test "::taobao_inventory_sync 应该不报错" do
    assert_nothing_raised do
      Item.taobao_inventory_sync(default_remote_user)
    end
  end
end
