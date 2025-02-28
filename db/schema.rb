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

ActiveRecord::Schema[7.1].define(version: 2024_06_18_041927) do
  create_table "goods", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.string "oshi"
    t.date "start_date"
    t.date "end_date"
    t.string "locate"
    t.string "url"
    t.boolean "ticket"
    t.boolean "deposit"
    t.boolean "preparation"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_private"
    t.boolean "transportation"
    t.boolean "lodging"
    t.integer "owner_id"
    t.string "memo"
  end

  create_table "suggests", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_title"
    t.string "oshi"
    t.date "start_date"
    t.date "end_date"
    t.string "locate"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
