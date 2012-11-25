# -*- encoding : utf-8 -*-
class CreateSellerCats < ActiveRecord::Migration
  def change
    create_table :seller_cats do |t|
      t.string :tb_type
      t.integer :tb_cid, limit: 8, null: false
      t.integer :tb_parent_cid, limit: 8, null: false
      t.string :tb_name, null: false
      t.string :tb_pic_url
      t.integer :tb_sort_order
      t.integer :user_id, null: false
      t.integer :priority, default: 0

      t.timestamps
    end
  end
end
