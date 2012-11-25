# -*- encoding : utf-8 -*-
class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :tb_detail_url
      t.integer :tb_num_iid, limit: 8
      t.string :tb_title
      t.string :tb_seller_cids
      t.integer :tb_approve_status
      t.datetime :tb_modified
      t.datetime :desc_modified
      t.integer :user_id

      t.timestamps
    end
  end
end
