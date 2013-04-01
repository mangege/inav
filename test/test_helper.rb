# -*- encoding : utf-8 -*-
ENV["RAILS_ENV"] = "test"

require 'simplecov'
SimpleCov.start 'rails' do
  add_filter "app/models/taobao/api.rb"
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "mocha/setup"
require 'webmock/test_unit'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def default_user
    u = User.find_or_create_by_oauth2(default_oauth2_hash)
    create_user_shop(u)
    u
  end

  def login(user = nil)
    @controller.send :login_user, (user || default_user)
  end

  def logout
    @controller.send :logout_user
  end

  #oauth2
  def stub_oauth2_token
    stub_request(:post, "#{TaobaoConfig.oauth2_site}/token").to_return(body: default_oauth2_hash.to_json, status: 200,
                                                                         headers: {'Content-Type' => 'application/json'})
  end

  def stub_api_get(body)
    stub_api_get_request.to_return(body: body, status: 200)
  end

  def stub_api_post(body)
    stub_api_post_request.to_return(body: body, status: 200)
  end

  def stub_api_get_request
    url_reg = Regexp.new( Regexp.escape(TaobaoConfig.api_site) + ".*", 'i')
    stub_request(:get, url_reg)
  end

  def stub_api_post_request
    url = TaobaoConfig.api_site
    stub_request(:post, url)
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

  def to_taobao_hash(obj)
    result = {}
    columns = obj.taobao_columns
    columns.each do |column_name|
      new_name = column_name[3..-1]
      result[new_name] = obj.send(column_name)
    end
    yield result if block_given?
    result
  end

  def read_mock_data(filename)
    fullpath = File.join(Rails.root, '/test/mocks/', filename)
    File.read(fullpath)
  end

  def create_user_shop(u)
    FactoryGirl.create(:shop, user: u) if u.shop.nil?
    u.reload
  end
end
