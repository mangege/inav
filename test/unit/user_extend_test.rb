# -*- encoding : utf-8 -*-
require 'test_helper'

class UserExtendTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "#settings 默认应该返回{}" do
    user_extend = FactoryGirl.create(:user_extend)
    assert_equal({}, user_extend.settings)
  end
end
