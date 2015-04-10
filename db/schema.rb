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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150410172823) do

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "chat_rooms_users", force: :cascade do |t|
    t.integer "chat_room_id", limit: 4
    t.integer "user_id",      limit: 4
  end

  create_table "chats", force: :cascade do |t|
    t.integer  "chat_room_id", limit: 4,     null: false
    t.integer  "user_id",      limit: 4,     null: false
    t.text     "message",      limit: 65535, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "chats", ["chat_room_id"], name: "index_chats_on_chat_room_id", using: :btree
  add_index "chats", ["user_id"], name: "index_chats_on_user_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.integer  "prefecture_id", limit: 4
    t.string   "name",          limit: 255
    t.string   "kana",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_details", force: :cascade do |t|
    t.integer  "user_id",             limit: 4,                           null: false
    t.integer  "prefecture_id",       limit: 4,                           null: false
    t.integer  "city_id",             limit: 4,                           null: false
    t.string   "family_name",         limit: 255, default: "Family Name", null: false
    t.string   "first_name",          limit: 255, default: "First Name",  null: false
    t.datetime "avatar_updated_at"
    t.integer  "avatar_file_size",    limit: 4
    t.string   "avatar_content_type", limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "user_details", ["city_id"], name: "index_user_details_on_city_id", using: :btree
  add_index "user_details", ["prefecture_id"], name: "index_user_details_on_prefecture_id", using: :btree
  add_index "user_details", ["user_id"], name: "index_user_details_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
