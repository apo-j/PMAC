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
ActiveRecord::Schema.define(version: 20140111130106) do
=======
ActiveRecord::Schema.define(version: 20140119212517) do
>>>>>>> d3580991e57b88bc55c311f8442e341539191901

  create_table "addresses", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "postal"
    t.string   "country"
    t.string   "address_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["address_type"], name: "index_addresses_on_address_type", using: :btree
  add_index "addresses", ["user_id"], name: "fk_address", using: :btree

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
    t.string   "image_url"
=======
    t.string   "url"
>>>>>>> d3580991e57b88bc55c311f8442e341539191901
  end

  add_index "colors", ["code"], name: "index_colors_on_code", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "materials", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["code"], name: "index_materials_on_code", using: :btree

  create_table "modes", force: true do |t|
    t.string   "category"
    t.string   "code"
<<<<<<< HEAD
=======
    t.string   "picture"
>>>>>>> d3580991e57b88bc55c311f8442e341539191901
    t.boolean  "is_top"
    t.integer  "price_id"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
    t.string   "image_url"
    t.string   "name"
=======
>>>>>>> d3580991e57b88bc55c311f8442e341539191901
  end

  add_index "modes", ["category", "is_top"], name: "index_modes_on_category_and_is_top", using: :btree
  add_index "modes", ["code"], name: "index_modes_on_code", using: :btree
  add_index "modes", ["price_id"], name: "fk_mose", using: :btree

  create_table "navbars", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "picture"
    t.boolean  "is_top"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "order"
  end

  add_index "navbars", ["code"], name: "index_navbars_on_code", using: :btree
  add_index "navbars", ["is_top"], name: "index_navbars_on_is_top", using: :btree
  add_index "navbars", ["parent_id"], name: "fk_navbar", using: :btree

  create_table "orders", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mail"
    t.string   "fax"
    t.string   "fix_tel"
    t.string   "mobile_tel"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["mail"], name: "index_people_on_mail", using: :btree
  add_index "people", ["user_id"], name: "fk_person", using: :btree

  create_table "prices", force: true do |t|
<<<<<<< HEAD
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "widths"
    t.text     "heights"
    t.text     "prices"
=======
    t.string   "height"
    t.string   "width"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
>>>>>>> d3580991e57b88bc55c311f8442e341539191901
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
    t.decimal  "price",       precision: 8,  scale: 2
    t.string   "material"
    t.string   "color"
    t.string   "color_side"
    t.string   "mode"
    t.decimal  "height",      precision: 10, scale: 0
    t.decimal  "total_price", precision: 8,  scale: 2
    t.integer  "width"
=======
    t.decimal  "price",      precision: 8, scale: 2
>>>>>>> d3580991e57b88bc55c311f8442e341539191901
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password_digest"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
=======
    t.string   "remember_token"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
>>>>>>> d3580991e57b88bc55c311f8442e341539191901
  add_index "users", ["user_type"], name: "index_users_on_user_type", using: :btree

end
