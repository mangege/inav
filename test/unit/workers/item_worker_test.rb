# -*- encoding : utf-8 -*-
require 'test_helper'
class ItemWorkerTest < ActiveSupport::TestCase
  test "UpdateOnsale#perform 应该更新描述" do
#TODO 应该使用webmock
=begin
    iwu = ItemWorker::UpdateOnsale.new
    user = default_user
    FactoryGirl.create_list(:item, 3, user: user, tb_approve_status: :onsale)

    SellerCat.expects(:taobao_list_sync).once
    Item.expects(:taobao_onsale_sync).once
    Item.expects(:taobao_desc_sync).once
    Item.expects(:taobao_desc_update).at_least_once

    item = user.items.first
    assert_not_equal item.tb_desc, item.new_desc
    iwu.perform(user)
    item.reload
    assert_equal item.tb_desc, item.new_desc
=end
  end
end
