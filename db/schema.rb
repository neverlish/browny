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

ActiveRecord::Schema.define(version: 20160821050620) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_likes_on_spot_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_places_on_city_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "spot_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_posts_on_spot_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "spot_rates", force: :cascade do |t|
    t.integer  "spot_id"
    t.integer  "post_id"
    t.integer  "alpha"
    t.integer  "bravo"
    t.integer  "charlie"
    t.integer  "delta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_spot_rates_on_post_id"
    t.index ["spot_id"], name: "index_spot_rates_on_spot_id"
  end

  create_table "spot_reads", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_spot_reads_on_spot_id"
    t.index ["user_id"], name: "index_spot_reads_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string   "name"
    t.integer  "place_id"
    t.integer  "category",   null: false
    t.integer  "status",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_spots_on_place_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "uid"
    t.string   "image"
    t.string   "provider"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
