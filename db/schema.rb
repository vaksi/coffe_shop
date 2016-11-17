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

ActiveRecord::Schema.define(version: 20161117015617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "condiments", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.integer  "type_id"
    t.decimal  "fee"
  end

  add_index "condiments", ["category_id"], name: "index_condiments_on_category_id", using: :btree
  add_index "condiments", ["type_id"], name: "index_condiments_on_type_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "category_id"
    t.string   "image",       default: "portofolio/folio01.jpg"
  end

  add_index "menus", ["category_id"], name: "index_menus_on_category_id", using: :btree

  create_table "order_condiments", force: :cascade do |t|
    t.integer  "condiment_id"
    t.integer  "order_item_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "order_condiments", ["condiment_id"], name: "index_order_condiments_on_condiment_id", using: :btree
  add_index "order_condiments", ["order_item_id"], name: "index_order_condiments_on_order_item_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.decimal  "price"
    t.integer  "quantity"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "menu_id"
    t.integer  "size_id"
    t.integer  "price_id"
    t.integer  "order_id"
    t.integer  "type_id"
    t.decimal  "price_total", default: 0.0
  end

  add_index "order_items", ["menu_id"], name: "index_order_items_on_menu_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["price_id"], name: "index_order_items_on_price_id", using: :btree
  add_index "order_items", ["size_id"], name: "index_order_items_on_size_id", using: :btree
  add_index "order_items", ["type_id"], name: "index_order_items_on_type_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "status",           default: "cart"
    t.decimal  "payment_total"
    t.string   "payment_state",    default: "pending"
    t.string   "payment_method"
    t.string   "delivery",         default: "take_away"
    t.datetime "take_away_at"
    t.string   "customer_email"
    t.string   "customer_name"
    t.string   "customer_phone"
    t.string   "customer_address"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "prices", force: :cascade do |t|
    t.decimal  "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "menu_id"
    t.integer  "size_id"
  end

  add_index "prices", ["menu_id"], name: "index_prices_on_menu_id", using: :btree
  add_index "prices", ["size_id"], name: "index_prices_on_size_id", using: :btree

  create_table "sizes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "sizes", ["category_id"], name: "index_sizes_on_category_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "types", ["category_id"], name: "index_types_on_category_id", using: :btree

  add_foreign_key "condiments", "categories"
  add_foreign_key "condiments", "types"
  add_foreign_key "menus", "categories"
  add_foreign_key "order_condiments", "condiments"
  add_foreign_key "order_condiments", "order_items"
  add_foreign_key "order_items", "menus"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "prices"
  add_foreign_key "order_items", "sizes"
  add_foreign_key "order_items", "types"
  add_foreign_key "prices", "menus"
  add_foreign_key "prices", "sizes"
  add_foreign_key "sizes", "categories"
  add_foreign_key "types", "categories"
end
