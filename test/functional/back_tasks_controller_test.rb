# -*- encoding : utf-8 -*-
require 'test_helper'

class BackTasksControllerTest < ActionController::TestCase
  setup do
    login
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
