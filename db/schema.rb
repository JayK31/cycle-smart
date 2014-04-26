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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140426174736) do
=======
ActiveRecord::Schema.define(version: 20140426174930) do
>>>>>>> 4ca7cd51514a75ce2518169d959b063623ee29f1

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "routes", force: true do |t|
    t.string   "start_point"
    t.string   "end_point"
    t.integer  "safety_score"
    t.text     "description"
=======
  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
>>>>>>> 4ca7cd51514a75ce2518169d959b063623ee29f1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
