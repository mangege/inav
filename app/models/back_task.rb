# -*- encoding : utf-8 -*-
class BackTask < ActiveRecord::Base
  TASK_TYPE_NAMES = {}
  extend Enumerize
  enumerize :task_status, in: %w[pending processing success fail]

  scope :in_progress, where(task_status: %w[pending processing])

  class << self
    TASK_TYPE_NAMES[:update_one_item] = "更新一个商品"
    def update_one_item(user)
    end

    TASK_TYPE_NAMES[:update_onsale_items] = "更新出售中的商品"
    def update_onsale_items(user)
      add_task(user, __method__, ItemWorker::UpdateOnsale, user.id)
    end

    TASK_TYPE_NAMES[:update_inventory_items] = "更新库存中的商品"
    def update_inventory_items(user)
    end

    TASK_TYPE_NAMES[:update_all_items] = "更新所有商品"
    def update_all_items(user)
    end

    TASK_TYPE_NAMES[:sync_shop] = "同步店铺信息"
    def sync_shop(user)

    end

    TASK_TYPE_NAMES[:sync_seller_cats] = "同步店铺分类"
    def sync_seller_cats(user)

    end

    TASK_TYPE_NAMES[:sync_items] = "同步商品"
    def sync_items(user)

    end

    #用户任务
    def user_tasks(user)

    end

    private
    def add_task(user, task_type, task_klass, *task_args)
      if BackTask.in_progress.exists?(user_id: user.id, task_type: task_type)
        false
      else
        task = BackTask.new
        task.task_status = :pending
        task.task_type = task_type
        task.user_id = user.id
        task.save!
        task_klass.perform_async(*task_args, task.id)
        true
      end
    end
  end
end
