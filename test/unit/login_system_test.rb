# -*- encoding : utf-8 -*-
require 'test_helper'
require 'login_system'

class LoginSystemTest < ActionController::TestCase
  tests ApplicationController

  test "#logged_in? 登录成功后应该返回true" do
    @controller.send(:login_user, default_user)
    assert @controller.send(:logged_in?)
  end

  test "#logged_in? 退出登录后应该返回false" do
    @controller.send(:login_user, default_user)
    assert @controller.send(:logged_in?)

    @controller.send(:logout_user)
    assert !@controller.send(:logged_in?)
  end

  #TODO 测试完善
end
