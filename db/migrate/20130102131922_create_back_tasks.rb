# -*- encoding : utf-8 -*-
class CreateBackTasks < ActiveRecord::Migration
  def change
    create_table :back_tasks do |t|
      t.string :task_status, default: :pending
      t.string :task_type, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
