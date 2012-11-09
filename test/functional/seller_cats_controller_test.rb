require 'test_helper'

class SellerCatsControllerTest < ActionController::TestCase
  test "should get index" do
    login
    get :index
    assert_response :success
  end

end
