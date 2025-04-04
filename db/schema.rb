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

ActiveRecord::Schema[8.0].define(version: 2025_03_23_084838) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_stock_id", null: false
    t.index ["product_stock_id"], name: "index_notifications_on_product_stock_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "purchase_order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.decimal "price", null: false
    t.decimal "total_amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_order_items_on_product_id"
    t.index ["purchase_order_id"], name: "index_order_items_on_purchase_order_id"
  end

  create_table "payment_terms", force: :cascade do |t|
    t.string "name"
    t.integer "days"
    t.text "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_sizes", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "size_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_sizes_on_product_id"
    t.index ["size_id"], name: "index_product_sizes_on_size_id"
  end

  create_table "product_stocks", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "notification_stock", default: false
    t.integer "min_stock"
    t.bigint "warehouse_id", null: false
    t.index ["product_id"], name: "index_product_stocks_on_product_id"
    t.index ["warehouse_id"], name: "index_product_stocks_on_warehouse_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.date "delivery_date", null: false
    t.integer "status", default: 0
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "order_date"
    t.text "notes"
    t.string "order_number", null: false
    t.bigint "payment_term_id", null: false
    t.string "delivery_address"
    t.string "delivery_city"
    t.string "delivery_postal_code"
    t.string "delivery_province"
    t.index ["payment_term_id"], name: "index_purchase_orders_on_payment_term_id"
    t.index ["supplier_id"], name: "index_purchase_orders_on_supplier_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplier_contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supplier_id", null: false
    t.index ["supplier_id"], name: "index_supplier_contacts_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "company_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "address"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "capacity"
  end

  add_foreign_key "notifications", "product_stocks"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_items", "purchase_orders"
  add_foreign_key "product_sizes", "products"
  add_foreign_key "product_sizes", "sizes"
  add_foreign_key "product_stocks", "products"
  add_foreign_key "product_stocks", "warehouses"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
  add_foreign_key "purchase_orders", "payment_terms"
  add_foreign_key "purchase_orders", "suppliers"
  add_foreign_key "supplier_contacts", "suppliers"
end
