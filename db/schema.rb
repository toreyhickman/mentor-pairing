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

ActiveRecord::Schema.define(version: 20130922194636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.integer  "mentor_id"
    t.integer  "mentee_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "timezone"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "availabilities", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "timezone"
    t.string   "location"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "activation_code"
    t.boolean  "activated"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "twitter_handle"
    t.text     "bio"
    t.string   "interests"
    t.string   "gravatar_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
