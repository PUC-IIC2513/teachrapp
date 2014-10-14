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

ActiveRecord::Schema.define(version: 20141009153323) do

  create_table "announcements", force: true do |t|
    t.string   "title",                     null: false
    t.text     "content"
    t.integer  "level",      default: 1,    null: false
    t.boolean  "notify",     default: true
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "announcements", ["user_id"], name: "index_announcements_on_user_id"

  create_table "resources", force: true do |t|
    t.string   "name",              null: false
    t.text     "description"
    t.string   "file"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "resources", ["name"], name: "index_resources_on_name"
  add_index "resources", ["user_id"], name: "index_resources_on_user_id"

  create_table "resources_tags", id: false, force: true do |t|
    t.integer "resource_id"
    t.integer "tag_id"
  end

  add_index "resources_tags", ["resource_id", "tag_id"], name: "index_resources_tags_on_resource_id_and_tag_id", unique: true

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true
  add_index "tags", ["user_id"], name: "index_tags_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name",                     null: false
    t.string   "last_name",                      null: false
    t.string   "email",                          null: false
    t.string   "password_digest",                null: false
    t.string   "role",                           null: false
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "birthdate"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
