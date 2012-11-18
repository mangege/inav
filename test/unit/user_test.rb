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

  test "#find_or_create_shop 用户没有shop时应该从api拿并保存" do
    shop = FactoryGirl.build(:shop, user: nil)
    assert shop.new_record?

    Shop.expects(:taobao_shop_get).returns(shop)
    user = FactoryGirl.create(:user)
    shop2 = user.find_or_create_shop
    
    shop.reload
    assert !shop.new_record?
    assert_equal shop.id, shop2.id
  end

  test "#find_or_create_shop 用户有shop时应该直接读数据库" do
    shop = FactoryGirl.create(:shop)
    user = shop.user
    assert_equal user.find_or_create_shop.id, shop.id
  end

  test "#seller_cats_with_sync 默认不强制同步" do
    user = FactoryGirl.create(:user, seller_cats_updated_at: Time.now)
    SellerCat.expects(:taobao_sellercats_list_get).never
    user.seller_cats_with_sync
  end

  test "#seller_cats_with_sync force_sync为true时强制同步" do
    user = FactoryGirl.create(:user, seller_cats_updated_at: Time.now)
    SellerCat.expects(:taobao_sellercats_list_get).returns([]).once
    user.seller_cats_with_sync(force_sync: true)
  end

  test "#seller_cats_with_sync seller_cats_updated_at为空则进行同步" do
    user = FactoryGirl.create(:user, seller_cats_updated_at: nil)
    SellerCat.expects(:taobao_sellercats_list_get).returns([]).once
    user.seller_cats_with_sync
  end

  test "#seller_cats_with_sync seller_cats_updated_at在6小时前则进行同步" do
    user = FactoryGirl.create(:user, seller_cats_updated_at: 7.hour.ago)
    SellerCat.expects(:taobao_sellercats_list_get).returns([]).once
    user.seller_cats_with_sync
  end

  test "#seller_cats_with_sync seller_cats_updated_at在6小时内则不进行同步" do
    user = FactoryGirl.create(:user, seller_cats_updated_at: 5.hour.ago)
    SellerCat.expects(:taobao_sellercats_list_get).returns([]).never
    user.seller_cats_with_sync
  end

  test "#seller_cats_with_sync 数据库的记录不存在同步数据里应该删除" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create_list(:seller_cat, 3, user: user)
    assert_equal 3, user.seller_cats.count
    not_deleted_id = user.seller_cats.last.id
    SellerCat.stubs(:taobao_sellercats_list_get).returns([user.seller_cats.last])

    assert_difference "SellerCat.count", -2 do
      user.seller_cats_with_sync
    end
    assert_equal [not_deleted_id], user.seller_cats.reload.map(&:id)
  end

  test "#seller_cats_with_sync 数据库的记录存在同步数据里应该不处理" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create_list(:seller_cat, 3, user: user)
    assert_equal 3, user.seller_cats.count
    ids = user.seller_cats.map(&:id)
    SellerCat.stubs(:taobao_sellercats_list_get).returns(user.seller_cats)

    assert_difference "SellerCat.count", 0 do
      user.seller_cats_with_sync
    end
    assert_equal Set.new(ids), Set.new( user.seller_cats.reload.map(&:id) )
  end

  test "#seller_cats_with_sync 同步数据不存在数据库里应该创建" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create_list(:seller_cat, 3, user: user)
    new_seller_cat = FactoryGirl.build(:seller_cat, user: nil)
    new_cid = new_seller_cat.cid
    SellerCat.stubs(:taobao_sellercats_list_get).returns(user.seller_cats.dup.push(new_seller_cat))

    assert !user.seller_cats.reload.map(&:cid).include?(new_cid)
    assert_difference "SellerCat.count", 1 do
      user.seller_cats_with_sync
    end
    assert user.seller_cats.reload.map(&:cid).include?(new_cid)
  end

  test "#seller_cats_with_sync 同步完成后应该更新seller_cats_updated_at" do
    user = FactoryGirl.create(:user)
    assert_nil user.seller_cats_updated_at

    SellerCat.stubs(:taobao_sellercats_list_get).returns([])
    user.seller_cats_with_sync
    user.reload
    assert 1.minute > (Time.now - user.seller_cats_updated_at)

    old_time = user.seller_cats_updated_at
    user.seller_cats_with_sync(force_sync: true)
    assert user.seller_cats_updated_at > old_time
  end

  test "#seller_cats_with_sync 返回结果应该都是父分类" do
    user = FactoryGirl.create(:user, seller_cats_updated_at: Time.now)
    parent_seller_cat = FactoryGirl.create(:seller_cat, user: user)
    FactoryGirl.create_list(:sub_seller_cat, 3, parent_seller_cat: parent_seller_cat, user: user)
    user.reload

    assert user.seller_cats_with_sync.count > 0
    user.seller_cats_with_sync.each do |seller_cat|
      assert seller_cat.parent?
    end
  end

  private
  def default_keys
    keys = [:taobao_user_id]
    keys.concat([:taobao_user_nick, :access_token, :refresh_token,
                :expires_in, :re_expires_in, :r1_expires_in, :r2_expires_in, :w1_expires_in, :w2_expires_in])
    keys.map(&:to_s)
  end
end
