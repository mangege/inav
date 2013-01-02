# -*- encoding : utf-8 -*-
require 'test_helper'
class WorkerBaseTest < ActiveSupport::TestCase
  test "#perform 应该调用pre_process和post_process" do
    ItemWorker::UpdateOnsale.any_instance.stubs(:pre_process).once
    ItemWorker::UpdateOnsale.any_instance.stubs(:process).once
    ItemWorker::UpdateOnsale.any_instance.stubs(:post_process).once

    iwu = ItemWorker::UpdateOnsale.new
    iwu.perform(default_user, 1)
  end
end
