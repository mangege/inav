# -*- encoding : utf-8 -*-
require 'test_helper'

class BackTaskTest < ActiveSupport::TestCase
  setup do
    BackTask.delete_all
    Sidekiq::Queue.new("default").clear
  end

  test "#add_task 用户存在处理中的此类型任务应该返回false" do
    user = default_user
    assert BackTask.update_onsale_items(user)
    assert !BackTask.update_onsale_items(user)
  end
end
