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

  test "::taobao_desc_sync 应该不报错" do
    assert_nothing_raised do
      Item.taobao_desc_sync(default_remote_user)
    end
  end

  test "::taobao_desc_update 应该成功更新desc内容" do
    user = default_remote_user
    Item.taobao_onsale_sync(user)
    #Item.taobao_desc_sync(user)
    #item = user.items.first
    #assert_not_nil item

    #TODO 待实现
  end
end
