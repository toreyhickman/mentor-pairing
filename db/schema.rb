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

ActiveRecord::Schema.define(:version => 20130905211031) do

  create_table "appointments", :force => true do |t|
    t.integer  "mentor_id"
    t.integer  "mentee_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "timezone"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "availabilities", :force => true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "mentor_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "timezone",   :default => "UTC"
    t.string   "location"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "activation_code"
    t.boolean  "activated"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "twitter_handle"
  end

end
