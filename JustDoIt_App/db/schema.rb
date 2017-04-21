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

ActiveRecord::Schema.define(version: 20170420105626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "seat_number"
    t.text     "meeting_point"
    t.boolean  "smoker_friendly"
    t.string   "suburb"
    t.date     "date"
    t.time     "time"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_cars_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "car_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_comments_on_car_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "maps", force: :cascade do |t|
    t.string   "start_address"
    t.string   "destination_address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_passengers_on_car_id", using: :btree
    t.index ["user_id"], name: "index_passengers_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "phone"
    t.string   "company"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "cars", "users"
  add_foreign_key "comments", "cars"
  add_foreign_key "comments", "users"
  add_foreign_key "passengers", "cars"
  add_foreign_key "passengers", "users"
end
