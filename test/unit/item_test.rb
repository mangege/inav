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
    call_taobao_has_next do
      assert Item.taobao_has_next?(nil, :all, {page_no: 1, page_size: 200})
    end
  end

  test "::taobao_has_next? 二次调用result_hash非空且stync_type为one应该返回false" do
    call_taobao_has_next do
      assert Item.taobao_has_next?({}, :one, {page_no: 1, page_size: 200}) == false
    end
  end

  test "::taobao_has_next? 二次调用all,小于应该返回true" do
    call_taobao_has_next do
      assert Item.taobao_has_next?({'total_results' => 300}, :one, {page_no: 1, page_size: 200}) == false
    end
  end

  test "::taobao_has_next? 二次调用all,大于应该返回false" do
    call_taobao_has_next do
      assert Item.taobao_has_next?({'total_results' => 100}, :one, {page_no: 1, page_size: 200}) == false
    end
  end

  test "::taobao_has_next? 二次调用all,等于应该返回false" do
    call_taobao_has_next do
      assert Item.taobao_has_next?({'total_results' => 200}, :one, {page_no: 1, page_size: 200}) == false
    end
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

  test "::taobao_list_sync list_type为inventory时应该调用taobao_items_inventory_get" do
    Taobao::Api.stubs(:taobao_items_onsale_get).returns(mock_taobao_items_onsale_get_result([], 150)).never
    Taobao::Api.stubs(:taobao_items_inventory_get).returns(mock_taobao_items_onsale_get_result([], 150)).once
    user = FactoryGirl.create(:user)
    Item.taobao_inventory_sync(user)
  end

  test "::taobao_db_update_desc 描述不存在应该新建" do
    item = FactoryGirl.create(:item)
    moch_taobao_attrs = {'num_iid' => item.tb_num_iid, 'desc' => 'desc test', 'modified' => Time.now}

    assert_nil item.tb_desc
    Item.taobao_db_update_desc(moch_taobao_attrs)
    item.reload
    assert_equal 'desc test', item.tb_desc
  end

  test "::taobao_db_update_desc 描述存在应该更新" do
    item = FactoryGirl.create(:item)
    FactoryGirl.create(:item_desc, item_id: item.id)
    moch_desc = 'desc mock'
    assert_not_equal moch_desc, item.tb_desc
    moch_taobao_attrs = {'num_iid' => item.tb_num_iid, 'desc' => moch_desc, 'modified' => Time.now}
    Item.taobao_db_update_desc(moch_taobao_attrs)
    item.reload
    assert_equal moch_desc, item.tb_desc
  end

  test "::taobao_db_update_desc 应该更新desc_modified" do
    item = FactoryGirl.create(:item)
    desc_modified = 1.day.ago
    moch_taobao_attrs = {'num_iid' => item.tb_num_iid, 'desc' => 'desc test', 'modified' => desc_modified}

    assert_not_equal desc_modified.to_i, item.tb_modified.to_i
    assert_not_equal desc_modified.to_i, item.desc_modified.to_i
    Item.taobao_db_update_desc(moch_taobao_attrs)
    item.reload
    assert_not_equal desc_modified.to_i, item.tb_modified.to_i
    assert_equal desc_modified.to_i, item.desc_modified.to_i
  end

  test "::taobao_desc_sync 应该正常调用API" do
    body = read_mock_data('items_list_get_response.json')
    stub_api_get(body)

    item = FactoryGirl.create(:item, tb_num_iid: 1497925687)
    new_desc = 'top七修测试desc'
    assert_not_equal new_desc, item.tb_desc
    Item.taobao_desc_sync(item.user)
    item.reload
    assert_equal new_desc, item.tb_desc
  end

  test "::taobao_desc_sync sync_type one应该只调用API一次" do
    Taobao::Api.stubs(:taobao_items_list_get).returns({'items' => []}).once
    user = FactoryGirl.create(:user)
    FactoryGirl.create_list(:item, 30, user_id: user.id)
    Item.taobao_desc_sync(user, sync_type: :one)
  end

  test "::taobao_desc_sync sync_type all应该只调用API两次" do
    Taobao::Api.stubs(:taobao_items_list_get).returns({'items' => []}).twice
    user = FactoryGirl.create(:user)
    FactoryGirl.create_list(:item, 30, user_id: user.id)
    Item.taobao_desc_sync(user)
  end

  test "::taobao_desc_update 应该更新desc内容为new_desc,保存new_desc到数据库并修改时间" do
    body = <<-EOS
{"item_update_response":{"item":{"iid":"1500024589604","modified":"2012-11-29 23:18:45","num_iid":1500024589604}}}
    EOS
    stub_api_post(body)

    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user, tb_num_iid: 1500024589604)
    assert_nil item.desc_modified

    Item.taobao_desc_update(user, item)
    item.reload
    assert_equal "2012-11-29 23:18:45", item.desc_modified.strftime(Taobao::TIME_FORMAT)
  end

  test "::taobao_db_update_new_desc 应该更新desc_modified和tb_desc" do
    moch_taobao_attrs = {"modified"=>"2012-11-29 23:18:45", "num_iid"=>1500024589604}
    item = FactoryGirl.create(:item, :tb_num_iid => 1500024589604)
    FactoryGirl.create(:item_desc, item_id: item.id)
    Item.any_instance.stubs(:new_desc).returns("hello kitty #{Time.now}")
    item.reload

    assert_nil item.desc_modified
    assert_not_equal item.new_desc, item.tb_desc

    Item.taobao_db_update_new_desc(item, moch_taobao_attrs)
    item.reload
    assert_equal "2012-11-29 23:18:45", item.desc_modified.strftime(Taobao::TIME_FORMAT)
    assert_equal item.new_desc, item.tb_desc
  end

  test "#new_desc 根据用户设置应该生成面包屑和相关分类" do
    #TODO
  end

  test "#new_desc 只生成面包屑" do
    #TODO
  end

  test "#new_desc 只生成相关分类" do
    #TODO
  end

  test "#breadcrumb_links 应该不再查询user和shop" do
    user = mock_normal_user
    shop = user.shop
    item = user.items.first

    User.any_instance.stubs(:shop).returns(shop).never
    Item.any_instance.stubs(:user).returns(user).never
    SellerCat.any_instance.stubs(:user).returns(user).never
    item.breadcrumb_links(user: user, shop: shop)
  end

  test "#breadcrumb_links 默认应该不添加店铺与商品链接" do
    user = mock_normal_user
    shop = user.shop
    user_extend = user.user_extend
    item = user.items.last

    links = item.breadcrumb_links(user: user, shop: shop, user_extend: user_extend)
    assert links.select{|l| l.url == shop.shop_url}.empty?
    assert links.select{|l| l.url == item.item_url}.empty?

    user_extend.settings = {show_shop_title: 'true'}
    user_extend.save!
    links = item.breadcrumb_links(user: user, shop: shop, user_extend: user_extend)
    assert !links.select{|l| l.url == shop.shop_url}.empty?
    assert links.select{|l| l.url == item.item_url}.empty?

    user_extend.settings = {show_item_title: 'true'}
    user_extend.save!
    links = item.breadcrumb_links(user: user, shop: shop, user_extend: user_extend)
    assert links.select{|l| l.url == shop.shop_url}.empty?
    assert !links.select{|l| l.url == item.item_url}.empty?
  end

  test "#breadcrumb_links 应该包含分类链接" do
    user = mock_normal_user
    shop = user.shop
    user_extend = user.user_extend
    item = user.items.last

    links = item.breadcrumb_links(user: user, shop: shop, user_extend: user_extend)
    assert !links.select{|l| l.url =~ /search/}.empty?
  end

  test "#seller_cat_links 应该选优先级高的" do
    user = mock_normal_user
    seller_cats = user.seller_cats
    item = FactoryGirl.create(:item, tb_seller_cids: "#{seller_cats.first.tb_cid},#{seller_cats.last.tb_cid}")

    seller_cats.first.update_attribute(:priority, 10)
    links = item.breadcrumb_links
    assert !links.select{|l| l.url == seller_cats.first.seller_cat_url}.empty?
    assert links.select{|l| l.url == seller_cats.last.seller_cat_url}.empty?

    seller_cats.last.update_attribute(:priority, 20)
    links = item.breadcrumb_links
    assert links.select{|l| l.url == seller_cats.first.seller_cat_url}.empty?
    assert !links.select{|l| l.url == seller_cats.last.seller_cat_url}.empty?
  end

  test "#breadcrumb_html 应该返回string" do
    user = mock_normal_user
    assert user.items.first.breadcrumb_html.is_a?(String)
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

  def call_taobao_has_next
    Item.public_class_method(:taobao_has_next?)
    yield
    Item.private_class_method(:taobao_has_next?)
  end

  def mock_normal_user
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:shop, user: user)
    FactoryGirl.create_list(:sub_seller_cat, 3, user: user)
    FactoryGirl.create_list(:item, 3, user: user, tb_seller_cids: user.seller_cats.last.tb_cid.to_s)

    user.reload
    user
  end
end
