# -*- encoding : utf-8 -*-
require 'test_helper'

class SellerCatsControllerTest < ActionController::TestCase
  setup do
    login
  end

  test "should get index" do
    SellerCat.stubs(:taobao_sellercats_list_get).returns([])
    get :index
    assert_response :success
  end

  test "#update_priorities 更新成功后应该重定向到index" do
    seller_cat = FactoryGirl.create(:seller_cat, user: @controller.current_user)

    params = {priorities: {seller_cat.id => 1} }
    put :update_priorities, params

    assert_redirected_to seller_cats_path
  end
end
