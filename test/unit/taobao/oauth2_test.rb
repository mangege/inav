# -*- encoding : utf-8 -*-
require 'test_helper'

class Taobao::OAuth2Test < ActiveSupport::TestCase
  setup do
    stub_oauth2_token
    @client = Taobao::OAuth2.oauth2_client
  end

  test "参数应该和TAOBAO_CONFIG相同" do
    assert_equal @client.site, TAOBAO_CONFIG[:oauth2_site]
    assert_equal @client.id, TAOBAO_CONFIG[:app_key]
    assert_equal @client.secret, TAOBAO_CONFIG[:app_secret]
  end

  test "#result 结果应该齐全不为空" do
    result = Taobao::OAuth2.result(code: 1).with_indifferent_access
    User::OAUTH2_ATTS.dup.push(:taobao_user_id).each do |key|
      assert_not_nil result[key], key
    end
  end
end
