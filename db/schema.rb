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

ActiveRecord::Schema[7.0].define(version: 2022_05_30_061720) do
  create_table "companies", force: :cascade do |t|
    t.string "corporate_name"
    t.string "brand_name"
    t.string "email_domain"
    t.string "cnpj"
    t.string "address"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "base_price"
  end

  create_table "delivery_times", force: :cascade do |t|
    t.integer "min_distance"
    t.integer "max_distance"
    t.integer "days"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_delivery_times_on_company_id"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "min_product_volume"
    t.decimal "max_product_volume"
    t.decimal "min_product_weight"
    t.decimal "max_product_weight"
    t.decimal "value_by_km"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_prices_on_company_id"
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "date_time"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_orders", force: :cascade do |t|
    t.string "code"
    t.string "product_address"
    t.string "product_code"
    t.decimal "product_height"
    t.decimal "product_width"
    t.decimal "product_depth"
    t.decimal "product_weight"
    t.integer "status", default: 0
    t.string "recipient_address"
    t.string "recipient_name"
    t.string "recipient_id"
    t.decimal "cost"
    t.integer "company_id"
    t.integer "price_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vehicle_id"
    t.integer "distance"
    t.index ["company_id"], name: "index_service_orders_on_company_id"
    t.index ["price_id"], name: "index_service_orders_on_price_id"
    t.index ["vehicle_id"], name: "index_service_orders_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_type"
    t.integer "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "plate"
    t.string "brand"
    t.string "model"
    t.string "year_of_fabrication"
    t.decimal "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "delivery_times", "companies"
  add_foreign_key "prices", "companies"
  add_foreign_key "service_orders", "companies"
  add_foreign_key "service_orders", "prices"
  add_foreign_key "service_orders", "vehicles"
  add_foreign_key "users", "companies"
end
