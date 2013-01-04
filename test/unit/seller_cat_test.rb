# -*- encoding : utf-8 -*-
require 'test_helper'

class SellerCatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "::taobao_list_sync 应该返回一个SellerCat数组" do
    body = <<-EOS
{
    "sellercats_list_get_response": {
        "seller_cats": {
            "seller_cat": [{
                "cid": 12345,
                "parent_cid": 12,
                "name": "自定义类型名称",
                "pic_url": "xva1sdfxxx.jpg",
                "sort_order": 1,
                "type": "manual_type"
            }]
        }
    }
}
    EOS
    stub_api_get(body)
    user = FactoryGirl.create(:user)
    seller_cats = SellerCat.taobao_list_sync(user)
    assert seller_cats.is_a?(Array)
    body_hash = MultiJson.load(body)
    seller_cat = seller_cats.first
    SellerCat.taobao_fields.each do |key|
      column_name = "tb_#{key}"
      assert_not_nil seller_cat.send(column_name), column_name
      assert_equal seller_cat.send(column_name), body_hash['sellercats_list_get_response']['seller_cats']['seller_cat'][0][key]
    end
  end

  test "#parent? parent_id为0则是父分类,否则应该是子分类" do
    seller_cat = FactoryGirl.build(:seller_cat)
    assert seller_cat.parent?
    assert !seller_cat.sub?

    seller_cat.tb_parent_cid = 1
    assert !seller_cat.parent?
    assert seller_cat.sub?
  end

  test "#update_priorities 应该更新对应记录的优先级" do
    seller_cat = FactoryGirl.create(:seller_cat)

    assert_equal 0, seller_cat.priority
    SellerCat.update_priorities({seller_cat.id => 1}, seller_cat.user)
    seller_cat.reload
    assert_equal 1, seller_cat.priority
  end

  test "#update_priorities 多条记录应该都更新成功" do
    user = FactoryGirl.create(:user)
    seller_cats = FactoryGirl.create_list(:seller_cat, 3, user: user)

    assert_equal [0]*3, seller_cats.map(&:priority)
    id_priorities = {}
    one = seller_cats[0..1]
    two = seller_cats[2..-1]
    one.each{|seller_cat| id_priorities[seller_cat.id] = 1}
    two.each{|seller_cat| id_priorities[seller_cat.id] = 2}
    
    SellerCat.update_priorities(id_priorities, user)
    one.each do |seller_cat|
      seller_cat.reload
      assert_equal 1, seller_cat.priority
    end
    two.each do |seller_cat|
      seller_cat.reload
      assert_equal 2, seller_cat.priority
    end
  end

  test "#update_priorities 只更新用户对应的记录,忽略非当前用户的更新" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    seller_cat = FactoryGirl.create(:seller_cat, user: user)
    seller_cat2 = FactoryGirl.create(:seller_cat, user: user2)

    assert_equal 0, seller_cat.priority
    assert_equal 0, seller_cat2.priority

    SellerCat.update_priorities({seller_cat.id => 1, seller_cat2.id => 1}, user)
    seller_cat.reload
    seller_cat2.reload
    assert_equal 1, seller_cat.priority
    assert_equal 0, seller_cat2.priority
  end

  test "#taobao_list_sync 数据库的记录不存在同步数据里应该删除" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create_list(:seller_cat, 3, user: user)
    assert_equal 3, user.seller_cats.count
    not_deleted_id = user.seller_cats.last.id
    mock_result_hash = mock_sellercats_list_get_result(user.seller_cats.last)
    Taobao::Api.stubs(:taobao_sellercats_list_get).returns(mock_result_hash)

    assert_difference "SellerCat.count", -2 do
      SellerCat.taobao_list_sync(user)
    end
    assert_equal [not_deleted_id], user.seller_cats.reload.map(&:id)
  end

  test "#taobao_list_sync 数据库的记录存在同步数据里应该不处理" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create_list(:seller_cat, 3, user: user)
    assert_equal 3, user.seller_cats.count
    ids = user.seller_cats.map(&:id)
    mock_result_hash = mock_sellercats_list_get_result(user.seller_cats)
    Taobao::Api.stubs(:taobao_sellercats_list_get).returns(mock_result_hash)

    assert_difference "SellerCat.count", 0 do
      SellerCat.taobao_list_sync(user)
    end
    assert_equal Set.new(ids), Set.new( user.seller_cats.reload.map(&:id) )
  end

  private
  def mock_sellercats_list_get_result(seller_cat)
    seller_cats = []
    if seller_cat.respond_to?(:each)
      seller_cat.each do |sc|
        seller_cats << to_taobao_hash(sc)
      end
    else
      seller_cats << to_taobao_hash(seller_cat)
    end
    {'seller_cats' => seller_cats}
  end
end
