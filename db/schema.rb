# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_04_025616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "software_suites", force: :cascade do |t|
    t.string "name"
    t.string "category", null: false
    t.bigint "hotelier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotelier_id"], name: "index_software_suites_on_hotelier_id"
  end

  create_table "softwares", force: :cascade do |t|
    t.string "name", null: false
    t.string "category", null: false
    t.string "version"
    t.string "logo_url"
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_softwares_on_vendor_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "payment_scheme"
    t.bigint "software_id", null: false
    t.bigint "software_suite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["software_id"], name: "index_subscriptions_on_software_id"
    t.index ["software_suite_id"], name: "index_subscriptions_on_software_suite_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "name"
    t.string "type"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "subscriptions", "software_suites"
  add_foreign_key "subscriptions", "softwares"
end
