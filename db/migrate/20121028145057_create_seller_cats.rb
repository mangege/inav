# -*- encoding : utf-8 -*-
class CreateSellerCats < ActiveRecord::Migration
  def change
    create_table :seller_cats do |t|
      t.string :cat_type
      t.integer :cid, limit: 8, null: false
      t.integer :parent_cid, limit: 8, null: false
      t.string :name, null: false
      t.string :pic_url
      t.integer :sort_order
      t.integer :user_id, null: false
      t.integer :priority, default: 0

      t.timestamps
    end
  end
end
