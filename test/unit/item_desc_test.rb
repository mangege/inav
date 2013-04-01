# -*- encoding : utf-8 -*-
require 'test_helper'

class ItemDescTest < ActiveSupport::TestCase
  test "#validates 中文保存后字符长度应该没有改变" do
    item_desc = FactoryGirl.build(:item_desc, content: "中文测试长度")
    assert_equal 6, item_desc.content.length
    item_desc.save!
    item_desc.reload
    assert_equal 6, item_desc.content.length
  end

  test "#validates 应该可以保存250000个中文" do
    item_desc = FactoryGirl.build(:item_desc, content: "中"*250000)
    assert_equal 250000, item_desc.content.length
    item_desc.save!
    item_desc.reload
    assert_equal 250000, item_desc.content.length
  end
end
