class CreateSellerCats < ActiveRecord::Migration
  def change
    create_table :seller_cats do |t|
      t.string :cat_type
      t.integer :cid
      t.integer :parent_cid
      t.string :name
      t.string :pic_url
      t.integer :sort_order
      t.integer :user_id
      t.integer :priority

      t.timestamps
    end
  end
end
