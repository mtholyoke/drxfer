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

ActiveRecord::Schema.define(version: 2020_02_03_200143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreements", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "folder_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer "agreement_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: :cascade do |t|
    t.integer "transfer_id"
    t.string "asset", limit: 255
    t.string "content_type", limit: 255
    t.integer "file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "md5", limit: 255
  end

  create_table "folders", force: :cascade do |t|
    t.string "path", limit: 255
    t.string "name", limit: 16
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "agreement_id"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "username", limit: 255
    t.string "email", limit: 255
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 255
    t.string "email", limit: 255
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
