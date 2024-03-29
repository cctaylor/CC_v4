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

ActiveRecord::Schema.define(:version => 20130913220122) do

  create_table "leads", :force => true do |t|
    t.string   "name_first"
    t.string   "name_last"
    t.string   "email"
    t.string   "phone"
    t.string   "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "remember_token"
  end

  add_index "leads", ["remember_token"], :name => "index_leads_on_remember_token"

  create_table "quotes", :force => true do |t|
    t.string   "name_first"
    t.string   "name_last"
    t.string   "email"
    t.string   "phone"
    t.string   "item"
    t.string   "color1"
    t.string   "color2"
    t.string   "paper"
    t.string   "fold"
    t.integer  "quantity"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name_first"
    t.string   "name_last"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
