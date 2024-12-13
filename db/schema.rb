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

ActiveRecord::Schema[7.1].define(version: 2024_12_13_032209) do
  create_table "redeem_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "is_active"
    t.json "size_options"
    t.json "extra_questions"
  end

  create_table "redeems", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "redeem_page_id", null: false
    t.integer "user_id", null: false
    t.json "data"
    t.string "status"
    t.index ["redeem_page_id"], name: "index_redeems_on_redeem_page_id"
    t.index ["user_id"], name: "index_redeems_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "redeems", "redeem_pages"
  add_foreign_key "redeems", "users"
end
