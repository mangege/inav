# -*- encoding : utf-8 -*-
require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "#content= item_desc不存在应该新建" do
    item = FactoryGirl.create(:item)
    assert_nil item.item_desc

    item.content = "a"*5
    assert_not_nil item.item_desc
    assert item.item_desc.new_record?
  end

  test "#content= item_desc存在应该只修改" do
    item = FactoryGirl.create(:item)
    FactoryGirl.create(:item_desc, item_id: item.id)
    item.reload

    assert_not_nil item.item_desc
    idid = item.item_desc.id
    assert !item.item_desc.content_changed?
    item.content = "b"*5
    assert_not_nil item.item_desc
    assert item.item_desc.content_changed?
    assert_equal idid, item.item_desc.id
  end

  test "::taobao_items_onsale_get 应该返回一个Item数组" do
    
  end
end
