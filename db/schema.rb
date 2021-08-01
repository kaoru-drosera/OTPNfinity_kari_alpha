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

ActiveRecord::Schema.define(version: 2021_07_31_025404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "samplers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "sampler_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_samplers_on_user_id"
  end

  create_table "seboards", force: :cascade do |t|
    t.bigint "sampler_id", null: false
    t.bigint "sefile_id", null: false
    t.integer "position"
    t.integer "btncolor"
    t.integer "volume"
    t.boolean "loopable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sampler_id"], name: "index_seboards_on_sampler_id"
    t.index ["sefile_id"], name: "index_seboards_on_sefile_id"
  end

  create_table "sefiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "sename"
    t.binary "sedata"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sefiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "samplers", "users"
  add_foreign_key "seboards", "samplers"
  add_foreign_key "seboards", "sefiles"
  add_foreign_key "sefiles", "users"
end
