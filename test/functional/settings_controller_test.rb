require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  setup do
    login
  end

  test "should get show" do
    get :show
    assert_response :success
  end
end
