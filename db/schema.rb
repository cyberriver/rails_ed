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

ActiveRecord::Schema.define(version: 2021_12_31_170442) do

  create_table "answers", force: :cascade do |t|
    t.string "title", limit: 1000, default: "PLS ENTER the TITLE", null: false
    t.integer "question_id", null: false
    t.boolean "correct", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "by answer id", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", limit: 1000, default: "pls enter the TITLE CATEGORY", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id_id"
    t.index ["category_id_id"], name: "index_categories_on_category_id_id"
    t.index ["id"], name: "by category id", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.string "body", limit: 1000, default: "pls enter the QUESTION BODY", null: false
    t.integer "test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "id_id"
    t.index ["id", "test_id"], name: "by question id and by test_id", unique: true
    t.index ["id_id"], name: "index_questions_on_id_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title", limit: 1000, default: "PLS ENTER the TITLE", null: false
    t.integer "level", default: 0, null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "id_id"
    t.index ["id", "category_id"], name: "by id and by category_id", unique: true
    t.index ["id_id"], name: "index_tests_on_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 1000, default: "pls enter the user name", null: false
    t.string "email", limit: 500, default: "no email provided", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "by user id", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "questions", "tests"
  add_foreign_key "tests", "categories"
end
