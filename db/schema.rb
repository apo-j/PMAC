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

ActiveRecord::Schema.define(version: 20140614093855) do

  create_table "addresses", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "postal"
    t.string   "country"
    t.string   "address_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "telephone"
    t.string   "last_name"
  end

  add_index "addresses", ["address_type"], name: "index_addresses_on_address_type", using: :btree
  add_index "addresses", ["user_id"], name: "fk_address", using: :btree

  create_table "alumia", force: true do |t|
    t.string   "profile"
    t.string   "pose"
    t.string   "coloris"
    t.string   "chassis"
    t.integer  "largeur"
    t.integer  "hauteur"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carousels", force: true do |t|
    t.string   "target"
    t.string   "src"
    t.string   "alt_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "page"
    t.integer  "order",      default: 0
    t.boolean  "is_active",  default: false
  end

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
    t.string   "image_url"
    t.boolean  "is_double_side"
    t.integer  "price_advance"
  end

  add_index "colors", ["code"], name: "index_colors_on_code", using: :btree

  create_table "frame_types", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frames", force: true do |t|
    t.integer  "frameTypes_id"
    t.string   "url"
    t.boolean  "sens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "frames", ["frameTypes_id"], name: "index_frames_on_frameTypes_id", using: :btree

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

  create_table "messages", force: true do |t|
    t.string   "object"
    t.string   "email"
    t.string   "file_path"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "command"
  end

  create_table "modes", force: true do |t|
    t.string   "category"
    t.string   "code"
    t.boolean  "is_top"
    t.integer  "price_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.string   "name"
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
    t.string   "state"
  end

  add_index "orders", ["state"], name: "idx_state", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "widths"
    t.text     "heights"
    t.text     "prices"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",       precision: 8,  scale: 2
    t.string   "material"
    t.string   "color"
    t.string   "color_side"
    t.string   "mode"
    t.decimal  "height",      precision: 10, scale: 0
    t.decimal  "total_price", precision: 8,  scale: 2
    t.integer  "width"
    t.integer  "detail_id"
    t.string   "detail_type"
  end

  create_table "pvcs", force: true do |t|
    t.string  "type_pose"
    t.string  "coloris"
    t.string  "position_coloris"
    t.string  "chassis"
    t.string  "ouverture"
    t.string  "sens"
    t.string  "seuil_alu"
    t.boolean "sans_soubassement"
    t.boolean "seurre"
    t.boolean "oscillo_battant"
    t.boolean "poignee_a_cle"
    t.boolean "grill_aeration"
    t.integer "largeur"
    t.integer "hauteur"
  end

  create_table "rideaux_metaliques", force: true do |t|
    t.string   "lame"
    t.integer  "largeur"
    t.integer  "hauteur"
    t.integer  "hauteur_lame_cobra"
    t.integer  "hauteur_lame_microperforet"
    t.boolean  "boitre_a_cle_exterieur"
    t.boolean  "bouton_poussoire"
    t.boolean  "telecommande"
    t.boolean  "sabot_viro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.integer  "largeur"
    t.integer  "avancer"
    t.string   "manoeuvre"
    t.string   "toile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password_digest"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["user_type"], name: "index_users_on_user_type", using: :btree

  create_table "volet_roulands", force: true do |t|
    t.string   "tablier"
    t.string   "coloris_tablier"
    t.string   "coloris_autre"
    t.string   "position_coffre"
    t.integer  "largeur"
    t.integer  "hauteur"
    t.string   "manoeuvre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
