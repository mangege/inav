# -*- encoding : utf-8 -*-
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'
require 'webmock/test_unit'

SimpleCov.start 'rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def default_user
    User.find_or_create_by_oauth2(default_oauth2_hash)
  end

  def login(user = nil)
    @controller.login_user(user || default_user)
  end

  def logout
    @controller.logout_user
  end

  #oauth2
  def oauth2_webmock
    stub_request(:post, "#{TAOBAO_CONFIG[:oauth2_site]}/token").to_return(body: default_oauth2_hash.to_json, status: 200,
                                                                         headers: {'Content-Type' => 'application/json'})
  end

  def default_oauth2_hash
    {"w2_expires_in"=>0,
      "taobao_user_id"=>263685215,
      "taobao_user_nick"=>
    "%E5%95%86%E5%AE%B6%E6%B5%8B%E8%AF%95%E5%B8%90%E5%8F%B752",
      "w1_expires_in"=>1800,
      "re_expires_in"=>0,
      "r2_expires_in"=>0,
      "expires_in"=>86400,
      "token_type"=>"Bearer",
      "refresh_token"=>"6200e1909ca29b04685c49d67f5ZZ3675347c0c6d5abccd263685215",
      "access_token"=>"6200819d9366af1383023a19907ZZf9048e4c14fd56333b263685215",
      "r1_expires_in"=>1800,
      "oauth2_updated_at" => Time.now}
  end
end
