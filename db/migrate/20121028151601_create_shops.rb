# -*- encoding : utf-8 -*-
class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :tb_sid, limit: 8
      t.integer :tb_cid, limit: 8
      t.string :tb_title
      t.string :tb_desc
      t.string :tb_bulletin
      t.string :tb_pic_path
      t.datetime :tb_created
      t.datetime :tb_modified
      t.integer :user_id

      t.timestamps
    end
  end
end
