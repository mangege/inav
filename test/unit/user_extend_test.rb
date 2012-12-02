# -*- encoding : utf-8 -*-
require 'test_helper'

class UserExtendTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "#settings 默认应该返回DEFAULT_SETTINGS" do
    user_extend = FactoryGirl.create(:user_extend)
    assert_equal(UserExtend::DEFAULT_SETTINGS, user_extend.settings)
  end

  test "#settings 数据库有值则直接返回" do
    user_extend = FactoryGirl.create(:user_extend, settings: {add_bread_crumb: 'false'})
    assert_equal(UserExtend::DEFAULT_SETTINGS.merge(add_bread_crumb: 'false'), user_extend.settings)
    assert_not_equal(UserExtend::DEFAULT_SETTINGS, user_extend.settings)
  end

  test "#settings= 应该只允许DEFAULT_SETTINGS keys" do
    user_extend = FactoryGirl.create(:user_extend)
    user_extend.settings = {add_bread_crumb: 'false', a:1}
    user_extend.save!

    assert !user_extend.settings.key?(:a)
    assert_equal 'false', user_extend.settings[:add_bread_crumb]
  end

  test "#settings= 应该自动填充默认值" do
    user_extend = FactoryGirl.create(:user_extend)
    settings = user_extend.send :read_attribute, :settings
    assert_nil settings[:add_bread_crumb]
    user_extend.settings = {}
    user_extend.save!
    user_extend.reload
    settings = user_extend.send :read_attribute, :settings
    assert_not_nil settings[:add_bread_crumb]
  end
end
