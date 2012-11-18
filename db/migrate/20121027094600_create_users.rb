# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :taobao_user_id, limit: 8, null: false
      t.string :taobao_user_nick, null: false
      t.string :access_token
      t.string :refresh_token
      t.integer :expires_in
      t.integer :re_expires_in
      t.integer :r1_expires_in
      t.integer :r2_expires_in
      t.integer :w1_expires_in
      t.integer :w2_expires_in
      t.integer :w2_expires_in
      t.datetime :oauth2_updated_at
      t.datetime :seller_cats_updated_at
      t.datetime :items_updated_at

      t.timestamps
    end
  end
end
