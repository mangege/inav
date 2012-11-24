# -*- encoding : utf-8 -*-
class CreateItemDescs < ActiveRecord::Migration
  def change
    create_table :item_descs, id: false do |t|
      t.column :item_id, 'int(11) PRIMARY KEY'
      t.text :content, limit: 25000*3
    end
  end
end
