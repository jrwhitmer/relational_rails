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

ActiveRecord::Schema.define(version: 2021_05_12_133957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer "dealership_id"
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "inspected"
    t.float "price"
  end

  create_table "dealerships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "open"
    t.integer "max_car_capacity"
  end

  create_table "farmers_market_stands", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "name"
    t.text "city"
    t.boolean "seasonal"
    t.integer "staffing"
  end

  create_table "produce_items", id: :bigint, default: -> { "nextval('produces_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "farmers_market_stand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "type"
    t.float "weight"
    t.float "price_by_weight"
    t.boolean "organic"
  end

  add_foreign_key "produce_items", "farmers_market_stands", name: "produces_stand_id_fkey"
end
