# -*- encoding : utf-8 -*-
class CreateUserExtends < ActiveRecord::Migration
  def change
    create_table :user_extends do |t|
      t.integer :user_id
      t.text :settings
      t.text :bread_crumb_template
      t.text :related_cat_template

      t.timestamps
    end
  end
end
