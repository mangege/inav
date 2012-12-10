# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121201082510) do

  create_table "item_descs", :primary_key => "item_id", :force => true do |t|
    t.text "content", :limit => 16777215
  end

  create_table "items", :force => true do |t|
    t.integer  "tb_num_iid",        :limit => 8
    t.string   "tb_title"
    t.string   "tb_seller_cids"
    t.string   "tb_approve_status"
    t.datetime "tb_modified"
    t.datetime "desc_modified"
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "seller_cats", :force => true do |t|
    t.string   "tb_type"
    t.integer  "tb_cid",        :limit => 8,                :null => false
    t.integer  "tb_parent_cid", :limit => 8,                :null => false
    t.string   "tb_name",                                   :null => false
    t.string   "tb_pic_url"
    t.integer  "tb_sort_order"
    t.integer  "user_id",                                   :null => false
    t.integer  "priority",                   :default => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "shops", :force => true do |t|
    t.integer  "tb_sid",      :limit => 8
    t.integer  "tb_cid",      :limit => 8
    t.string   "tb_title"
    t.string   "tb_desc"
    t.string   "tb_bulletin"
    t.string   "tb_pic_path"
    t.datetime "tb_created"
    t.datetime "tb_modified"
    t.integer  "user_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "user_extends", :force => true do |t|
    t.integer  "user_id"
    t.text     "settings"
    t.text     "bread_crumb_template"
    t.text     "related_cat_template"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "taobao_user_id",         :limit => 8, :null => false
    t.string   "taobao_user_nick",                    :null => false
    t.string   "access_token"
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.integer  "re_expires_in"
    t.integer  "r1_expires_in"
    t.integer  "r2_expires_in"
    t.integer  "w1_expires_in"
    t.integer  "w2_expires_in"
    t.datetime "oauth2_updated_at"
    t.datetime "seller_cats_updated_at"
    t.datetime "items_updated_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
