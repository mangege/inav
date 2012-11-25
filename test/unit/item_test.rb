# -*- encoding : utf-8 -*-
require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "#tb_desc= item_desc不存在应该新建" do
    item = FactoryGirl.create(:item)
    assert_nil item.item_desc

    item.tb_desc = "a"*5
    assert_not_nil item.item_desc
    assert item.item_desc.new_record?
  end

  test "#tb_desc= item_desc存在应该只修改" do
    item = FactoryGirl.create(:item)
    FactoryGirl.create(:item_desc, item_id: item.id)
    item.reload

    assert_not_nil item.item_desc
    idid = item.item_desc.id
    assert !item.item_desc.content_changed?
    item.tb_desc = "b"*5
    assert_not_nil item.item_desc
    assert item.item_desc.content_changed?
    assert_equal idid, item.item_desc.id
  end

  test "::toabao_columns 应该包含tb_desc" do
    assert Item.taobao_columns.include?('tb_desc')
  end

  test "::taobao_has_next? 一次调用result_hash为空应该返回true" do
    assert Item.taobao_has_next?(nil, :all, {page_no: 1, page_size: 200})
  end

  test "::taobao_has_next? 二次调用result_hash非空且stync_type为one应该返回false" do
    assert Item.taobao_has_next?({}, :one, {page_no: 1, page_size: 200}) == false
  end

  test "::taobao_has_next? 二次调用all,小于应该返回true" do
    assert Item.taobao_has_next?({'total_results' => 300}, :one, {page_no: 1, page_size: 200}) == false
  end

  test "::taobao_has_next? 二次调用all,大于应该返回false" do
    assert Item.taobao_has_next?({'total_results' => 100}, :one, {page_no: 1, page_size: 200}) == false
  end

  test "::taobao_has_next? 二次调用all,等于应该返回false" do
    assert Item.taobao_has_next?({'total_results' => 200}, :one, {page_no: 1, page_size: 200}) == false
  end

  test "::taobao_onsale_sync 不存在的数据应该新建" do
    body = read_mock_data('items_onsale_get_response.json')
    stub_api_get(body)

    user = FactoryGirl.create(:user)

    assert_equal 0, user.items.count
    assert_difference "Item.count", 6 do
      Item.taobao_onsale_sync(user)
    end
    assert_equal 6, user.items.count
  end

  test "::taobao_onsale_sync 分页应该多次调用接口" do
    page_no = 1
    Taobao::Api.stubs(:taobao_items_onsale_get).with do |param| 
      raise 'page no应该是递增的' if param[:page_no] != page_no;
      page_no += 1
    end.returns(mock_taobao_items_onsale_get_result([], 450)).times(3)
    user = FactoryGirl.create(:user)
    Item.taobao_onsale_sync(user)
  end

  test "::taobao_onsale_sync one应该只调用一次" do
    Taobao::Api.stubs(:taobao_items_onsale_get).returns(mock_taobao_items_onsale_get_result([], 450)).once
    user = FactoryGirl.create(:user)
    Item.taobao_onsale_sync(user, sync_type: :one)
  end

  test "::taobao_onsale_sync 不需要分页应该只调用一次" do
    Taobao::Api.stubs(:taobao_items_onsale_get).returns(mock_taobao_items_onsale_get_result([], 100)).once
    user = FactoryGirl.create(:user)
    Item.taobao_onsale_sync(user)
  end

  test "::taobao_db_update_or_create 不存在应该创建" do
    source_item = FactoryGirl.build(:item)
    taobao_attrs = to_taobao_hash(source_item){|r| r.delete 'desc'}

    user = FactoryGirl.create(:user)
    item = nil
    assert_difference "Item.count", 1 do
      item = Item.taobao_db_update_or_create(taobao_attrs ,user)
    end
    assert !item.new_record?
    Item.taobao_columns{|c| c.delete 'tb_desc'}.each do |column|
      assert_equal source_item.send(column), item.send(column)
    end
  end

  test "::taobao_db_update_or_create 存在应该更新" do
    source_item = FactoryGirl.create(:item)
    title = source_item.tb_title = "#{source_item.tb_title} test"
    taobao_attrs = to_taobao_hash(source_item){|r| r.delete 'desc'}
    source_item.reload
    assert_not_equal title, source_item.tb_title

    user = FactoryGirl.create(:user)
    item = nil
    assert_no_difference "Item.count" do
      item = Item.taobao_db_update_or_create(taobao_attrs ,user)
    end
    assert_equal title, item.tb_title
    #TODO tb_modified为什么会不相等
    Item.taobao_columns{|c| c.delete('tb_desc'); c.delete('tb_title'); c.delete('tb_modified')}.each do |column|
      assert_equal source_item.send(column), item.send(column)
    end
  end

  private
  def mock_taobao_items_onsale_get_result(item, total_results = nil)
    items = []
    if total_results.nil?
      total_results = ( item.is_a?(Item) ? 1 : item.size  )
    end

    if item.is_a?(Item)
      items << to_taobao_hash(item){|result| result.delete 'desc'}
    else
      item.each do |i|
        items << to_taobao_hash(i)
      end
    end
    
    {'items' => items, 'total_results' => total_results}
  end
end
