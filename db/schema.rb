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

ActiveRecord::Schema.define(version: 20170415055447) do

  create_table "Orders_Products", id: false, force: :cascade do |t|
    t.integer "order_id",   null: false
    t.integer "product_id", null: false
  end

  add_index "Orders_Products", ["order_id", "product_id"], name: "index_Orders_Products_on_order_id_and_product_id"
  add_index "Orders_Products", ["product_id", "order_id"], name: "index_Orders_Products_on_product_id_and_order_id"

  create_table "ingredients", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_products", id: false, force: :cascade do |t|
    t.integer "product_id"
    t.integer "ingredient_id"
  end

  add_index "ingredients_products", ["ingredient_id"], name: "index_ingredients_products_on_ingredient_id"
  add_index "ingredients_products", ["product_id"], name: "index_ingredients_products_on_product_id"

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.decimal  "total_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.text     "shippment_address"
    t.float    "amount"
    t.integer  "products_number"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.decimal  "subtotal"
    t.integer  "user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "category"
    t.decimal  "price"
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "storages", force: :cascade do |t|
    t.integer  "product_unit"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "is_administrator", default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
