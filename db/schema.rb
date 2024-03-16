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

ActiveRecord::Schema[7.1].define(version: 2024_03_16_074910) do
  create_table "cryptos", force: :cascade do |t|
    t.string "crypto_name"
    t.string "symbol"
    t.string "coingecko_id"
    t.decimal "current_price"
    t.integer "market_cap"
    t.integer "volume_24h"
    t.decimal "price_change_percentage_24h"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watchlist_cryptos", force: :cascade do |t|
    t.integer "watchlist_id", null: false
    t.integer "crypto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crypto_id"], name: "index_watchlist_cryptos_on_crypto_id"
    t.index ["watchlist_id"], name: "index_watchlist_cryptos_on_watchlist_id"
  end

  create_table "watchlists", force: :cascade do |t|
    t.string "watchlist_name"
    t.text "watchlist_description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "watchlist_cryptos", "cryptos"
  add_foreign_key "watchlist_cryptos", "watchlists"
  add_foreign_key "watchlists", "users"
end
