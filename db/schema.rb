# -*- encoding : utf-8 -*-
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

ActiveRecord::Schema.define(:version => 20121028151601) do

  create_table "seller_cats", :force => true do |t|
    t.string   "cat_type"
    t.integer  "cid"
    t.integer  "parent_cid"
    t.string   "name"
    t.string   "pic_url"
    t.integer  "sort_order"
    t.integer  "user_id"
    t.integer  "priority"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shops", :force => true do |t|
    t.integer  "sid"
    t.integer  "cid"
    t.string   "title"
    t.string   "desc"
    t.string   "bulletin"
    t.string   "pic_path"
    t.datetime "created"
    t.datetime "modified"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "taobao_user_id"
    t.string   "taobao_user_nick"
    t.string   "access_token"
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.integer  "re_expires_in"
    t.integer  "r1_expires_in"
    t.integer  "r2_expires_in"
    t.integer  "w1_expires_in"
    t.integer  "w2_expires_in"
    t.datetime "oauth2_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
