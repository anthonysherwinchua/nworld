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

ActiveRecord::Schema.define(version: 20170604055731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer  "shippable_country_id"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "contact_number"
    t.string   "hashed_id"
    t.integer  "status",               default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "carts", ["first_name"], name: "index_carts_on_first_name", using: :btree
  add_index "carts", ["hashed_id"], name: "index_carts_on_hashed_id", using: :btree
  add_index "carts", ["last_name"], name: "index_carts_on_last_name", using: :btree
  add_index "carts", ["shippable_country_id"], name: "index_carts_on_shippable_country_id", using: :btree
  add_index "carts", ["status"], name: "index_carts_on_status", using: :btree
  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "couriers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "couriers", ["name"], name: "index_couriers_on_name", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "cart_id",                     null: false
    t.integer  "line_package_id"
    t.integer  "product_id",                  null: false
    t.integer  "quantity",        default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["line_package_id"], name: "index_line_items_on_line_package_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "line_packages", force: :cascade do |t|
    t.integer  "cart_id",    null: false
    t.integer  "package_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "line_packages", ["cart_id"], name: "index_line_packages_on_cart_id", using: :btree
  add_index "line_packages", ["package_id"], name: "index_line_packages_on_package_id", using: :btree

  create_table "packages", force: :cascade do |t|
    t.decimal  "price",      precision: 8, scale: 2, null: false
    t.decimal  "worth",      precision: 8, scale: 2, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "content"
    t.string   "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id",                                         null: false
    t.string   "title",                                               null: false
    t.string   "unit",                                                null: false
    t.string   "directory_image"
    t.decimal  "price",           precision: 8, scale: 2,             null: false
    t.decimal  "weight",          precision: 5, scale: 2,             null: false
    t.integer  "status",                                  default: 0, null: false
    t.text     "description"
    t.json     "images"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "tags"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["status"], name: "index_products_on_status", using: :btree
  add_index "products", ["title"], name: "index_products_on_title", using: :btree
  add_index "products", ["unit"], name: "index_products_on_unit", using: :btree

  create_table "roles", force: :cascade do |t|
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "name",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "shippable_countries", force: :cascade do |t|
    t.integer  "zone_id",    null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shippable_countries", ["name"], name: "index_shippable_countries_on_name", using: :btree
  add_index "shippable_countries", ["zone_id"], name: "index_shippable_countries_on_zone_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["role_id"], name: "index_users_roles_on_role_id", using: :btree
  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  add_index "users_roles", ["user_id"], name: "index_users_roles_on_user_id", using: :btree

  create_table "zone_pricings", force: :cascade do |t|
    t.integer  "zone_id",                            null: false
    t.decimal  "price",      precision: 6, scale: 2, null: false
    t.decimal  "weight_min", precision: 6, scale: 2, null: false
    t.decimal  "weight_max", precision: 6, scale: 2, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "zone_pricings", ["zone_id"], name: "index_zone_pricings_on_zone_id", using: :btree

  create_table "zones", force: :cascade do |t|
    t.integer  "courier_id", null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "zones", ["courier_id"], name: "index_zones_on_courier_id", using: :btree
  add_index "zones", ["name"], name: "index_zones_on_name", using: :btree

  add_foreign_key "carts", "shippable_countries"
  add_foreign_key "carts", "users"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "line_packages"
  add_foreign_key "line_items", "products"
  add_foreign_key "line_packages", "carts"
  add_foreign_key "line_packages", "packages"
  add_foreign_key "products", "categories"
  add_foreign_key "shippable_countries", "zones"
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
  add_foreign_key "zone_pricings", "zones"
  add_foreign_key "zones", "couriers"
end
