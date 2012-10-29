# -*- encoding : utf-8 -*-
require 'remote_test_helper'

class TaobaoTest < ActiveSupport::TestCase
  test "应该有个默认用户" do
    assert default_remote_user_attrs.is_a?(Hash)
    assert_not_nil default_remote_user_attrs['taobao_user_nick']
    assert_not_nil default_remote_user_attrs['access_token']
  end

  test "网络,oauth2,sign应该正常,可以正确获取到卖家信息" do
    params = {}
    params[:method] = 'taobao.user.seller.get'
    params[:session] = default_remote_user_attrs['access_token']
    params[:fields] = 'user_id,nick'
    hash = Taobao::Client.execute(params)
    assert_equal default_remote_user_attrs['taobao_user_nick'], hash['user']['nick']
  end
end
