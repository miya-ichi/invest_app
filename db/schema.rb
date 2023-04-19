# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_18_145724) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.boolean "private", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "possessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.integer "volume", null: false
    t.float "price", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_possessions_on_stock_id"
    t.index ["user_id"], name: "index_possessions_on_user_id"
  end

  create_table "prices", force: :cascade do |t|
    t.bigint "stock_id", null: false
    t.date "date", null: false
    t.float "market_open"
    t.float "daily_high"
    t.float "daily_low"
    t.float "market_close", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id", "date"], name: "index_prices_on_stock_id_and_date", unique: true
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "category", null: false
    t.string "code", null: false
    t.string "name", null: false
    t.string "website"
    t.text "description"
    t.string "sector"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_stocks_on_code", unique: true
  end

  create_table "total_assets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date", null: false
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "date"], name: "index_total_assets_on_user_id_and_date", unique: true
    t.index ["user_id"], name: "index_total_assets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.boolean "admin", default: false, null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "notes", "users"
  add_foreign_key "possessions", "stocks"
  add_foreign_key "possessions", "users"
  add_foreign_key "prices", "stocks"
  add_foreign_key "total_assets", "users"
end
