# -*- encoding : utf-8 -*-
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "::find_or_create_by_oauth2 taobao_user_id为空时应该报ArgumentError" do
    assert_raise ArgumentError do
      User.find_or_create_by_oauth2( {} )
    end
    assert_nothing_raised ArgumentError do
      User.find_or_create_by_oauth2( default_oauth2_hash )
    end
  end

  test "::find_or_create_by_oauth2 用户不存在则创建新的用户" do
    hash = default_oauth2_hash
    user = User.find_by_taobao_user_id(hash['taobao_user_id'])
    user.destroy unless user.nil?

    assert_difference "User.count" do
      User.find_or_create_by_oauth2(default_oauth2_hash)
    end
  end

  test "::find_or_create_by_oauth2 用户存在则返回" do
    hash = default_oauth2_hash
    user = User.find_by_taobao_user_id(hash['taobao_user_id'])
    if user.nil?
      User.find_or_create_by_oauth2(default_oauth2_hash)
    end

    assert_no_difference "User.count" do
      User.find_or_create_by_oauth2(default_oauth2_hash)
    end
  end

  test "::find_or_create_by_oauth2 新建用户值应该正确" do
    hash = default_oauth2_hash
    user = User.find_by_taobao_user_id(hash['taobao_user_id'])
    user.destroy unless user.nil?

    user = User.find_or_create_by_oauth2(hash)
    keys = default_keys
    assert_equal hash.slice(*keys), user.attributes.slice(*keys)
  end

  test "::find_or_create_by_oauth2 用户存在则应该更新" do
    hash = default_oauth2_hash
    new_hash = {"w2_expires_in"=>20,
      "taobao_user_id"=>263685215,
      "taobao_user_nick"=>
    "2%E5%95%86%E5%AE%B6%E6%B5%8B%E8%AF%95%E5%B8%90%E5%8F%B752",
      "w1_expires_in"=>21800,
      "re_expires_in"=>20,
      "r2_expires_in"=>20,
      "expires_in"=>286400,
      "token_type"=>"Bearer",
      "refresh_token"=>"26200e1909ca29b04685c49d67f5ZZ3675347c0c6d5abccd263685215",
      "access_token"=>"26200819d9366af1383023a19907ZZf9048e4c14fd56333b263685215",
      "r1_expires_in"=>21800,
      "oauth2_updated_at" => Time.now}

    keys = default_keys
    assert_not_equal hash.slice(*keys), new_hash.slice(*keys)

    user = User.find_or_create_by_oauth2(hash)
    user.reload
    assert_equal hash.slice(*keys), user.attributes.slice(*keys)

    User.find_or_create_by_oauth2(new_hash)
    user.reload
    assert_equal new_hash.slice(*keys), user.attributes.slice(*keys)
  end

  test "#oauth2_expired 应该根据是否过期返回一个boolean值" do
    user = FactoryGirl.build(:user, oauth2_updated_at: Time.now-100, expires_in: 10)
    assert user.oauth2_expired?
    user = FactoryGirl.build(:user, oauth2_updated_at: Time.now-100, expires_in: 1000)
    assert !user.oauth2_expired?
  end

  private
  def default_keys
    keys = [:taobao_user_id]
    keys.concat([:taobao_user_nick, :access_token, :refresh_token,
                :expires_in, :re_expires_in, :r1_expires_in, :r2_expires_in, :w1_expires_in, :w2_expires_in])
    keys.map(&:to_s)
  end
end
