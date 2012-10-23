# -*- encoding : utf-8 -*-
require 'test_helper'

class Taobao::OAuth2Test < ActiveSupport::TestCase
  setup do
    @client = Taobao::OAuth2.oauth2_client
  end

  test "参数应该和TAOBAO_CONFIG相同" do
    assert_equal @client.site, TAOBAO_CONFIG[:oauth2_site]
    assert_equal @client.id, TAOBAO_CONFIG[:app_key]
    assert_equal @client.secret, TAOBAO_CONFIG[:app_secret]
  end
end
