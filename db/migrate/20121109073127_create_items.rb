# -*- encoding : utf-8 -*-
class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :detail_url
      t.integer :num_iid, limit: 8
      t.string :title
      t.string :seller_cids
      t.integer :approve_status
      t.datetime :desc_modified
      t.datetime :modified
      t.integer :user_id

      t.timestamps
    end
  end
end
