# -*- encoding : utf-8 -*-
require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    stub_oauth2_token
  end

  test "#new 未登录应该重定向到授权页" do
    get :new
    assert_response :redirect
    assert_match Regexp.new(TaobaoConfig.oauth2_site), @response.location
  end

  test "#new 已登录应该重定向到首页" do
    login
    get :new
    assert_redirected_to '/'
  end

  test "#callback 授权失败应该显示登录提示页" do
    get :callback
    assert_template 'not_login'
  end

  test "#callback 授权成功应该重定向" do
    @controller.expects(:check_seller_and_sync_shop).returns(true)
    get :callback, code: 1
    assert_response :redirect
  end

  test "#not_login 用户没有登录则显示登录提示页" do
    get :not_login
    assert_template 'not_login'
  end

  test "#not_login 用户已登录则重定向到首页" do
    login
    get :not_login
    assert_redirected_to '/'
  end

  test "#oauth2_expired 应该退出登录且显示登录提示页" do
    login
    assert @controller.send(:logged_in?)

    get :oauth2_expired
    assert !@controller.send(:logged_in?)
    assert_template 'not_login'
  end
end
