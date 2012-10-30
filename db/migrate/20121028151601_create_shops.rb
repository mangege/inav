# -*- encoding : utf-8 -*-
class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :sid
      t.integer :cid
      t.string :title
      t.string :desc
      t.string :bulletin
      t.string :pic_path
      t.datetime :created
      t.datetime :modified
      t.integer :user_id

      t.timestamps
    end
  end
end
