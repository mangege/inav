require 'test_helper'

class MainControllerTest < ActionController::TestCase
  setup do
    login
  end

  test "should get index" do
    shop = FactoryGirl.build(:shop, user: nil)
    Shop.expects(:taobao_shop_get).returns(shop)

    get :index
    assert_response :success
  end

end
