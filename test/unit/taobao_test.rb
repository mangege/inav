# -*- encoding : utf-8 -*-
require 'test_helper'

class TaobaoTest < ActiveSupport::TestCase
  test "应该正常require taobao目录下文件" do
    assert_nothing_raised do
      Taobao
    end

    assert_nothing_raised do
      Taobao::OAuth2
    end
  end
end
