require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  setup do
    login
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should put update" do
    put :update, UserExtend::DEFAULT_SETTINGS.merge(add_bread_crumb: 'false')
    assert_redirected_to action: :show
  end
end
