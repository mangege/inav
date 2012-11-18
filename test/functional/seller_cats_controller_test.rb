require 'test_helper'

class SellerCatsControllerTest < ActionController::TestCase
  test "should get index" do
    login
    SellerCat.stubs(:taobao_sellercats_list_get).returns([])
    get :index
    assert_response :success
  end

end
