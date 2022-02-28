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

ActiveRecord::Schema.define(version: 2020_02_03_200143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreements", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "folder_id"
  end

  create_table "assignments", id: :serial, force: :cascade do |t|
    t.integer "agreement_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", id: :serial, force: :cascade do |t|
    t.integer "transfer_id"
    t.string "asset"
    t.string "content_type"
    t.integer "file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "md5"
  end

  create_table "folders", id: :serial, force: :cascade do |t|
    t.string "path"
    t.string "name", limit: 16
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transfers", id: :serial, force: :cascade do |t|
    t.integer "agreement_id"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "username"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
