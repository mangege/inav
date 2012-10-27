# -*- encoding : utf-8 -*-
require 'test_helper'

class LoadConfigTest < ActiveSupport::TestCase
  test "::process! 配置值为空应该报错" do
    assert_nothing_raised do
      LoadConfig.process!({:a => 1}, [:a])
    end
    assert_raise ArgumentError do
      LoadConfig.process!({:a => nil}, [:a])
    end
    assert_raise ArgumentError do
      LoadConfig.process!({:a => nil})
    end
    assert_raise ArgumentError do
      LoadConfig.process!({}, [:a])
    end
  end

  test "::process! 配置值两边有空格应该删除" do
    hash = {:a => '1', :b => ' 2 '}
    LoadConfig.process!(hash, [:a])
    assert_equal hash[:a], '1'
    assert_equal hash[:b], '2'
  end
end
