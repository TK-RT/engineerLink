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

ActiveRecord::Schema.define(version: 2020_07_12_080008) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.integer "user_id"
    t.text "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer"], name: "index_answers_on_answer"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "article_title", null: false
    t.text "article_body", null: false
    t.integer "programming_language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["article_body"], name: "index_articles_on_article_body"
    t.index ["article_title"], name: "index_articles_on_article_title"
    t.index ["programming_language_id"], name: "index_articles_on_programming_language_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "main_office", null: false
    t.string "ceo", null: false
    t.integer "employee_number"
    t.date "foundation_date", null: false
    t.boolean "is_listing", default: true, null: false
    t.string "hp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_name"], name: "index_companies_on_company_name"
    t.index ["main_office"], name: "index_companies_on_main_office"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "company_id"
    t.integer "user_id"
    t.float "average", null: false
    t.float "working_time", null: false
    t.float "rewarding", null: false
    t.float "communication", null: false
    t.float "holiday", null: false
    t.float "salary", null: false
    t.float "growth_environment"
    t.integer "employment_type", default: 0, null: false
    t.integer "generation", default: 0, null: false
    t.integer "enrollment_period", default: 0, null: false
    t.boolean "is_enrollment", default: true, null: false
    t.integer "annual_income", null: false
    t.text "review", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gender", default: 0, null: false
    t.index ["company_id"], name: "index_evaluations_on_company_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "article_id"
  end

  create_table "post_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_images", force: :cascade do |t|
    t.string "image_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programming_languages", force: :cascade do |t|
    t.string "programming_language", null: false
    t.boolean "is_enabled", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "programming_language_id"
    t.string "question_title"
    t.text "question_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "best_answer_id"
    t.integer "#<ActiveRecord::ConnectionAdapters::SQLite3::TableDefinition:0x0000000004d7f9e8>"
    t.index ["programming_language_id"], name: "index_questions_on_programming_language_id"
    t.index ["question_body"], name: "index_questions_on_question_body"
    t.index ["question_title"], name: "index_questions_on_question_title"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.date "birthday", null: false
    t.integer "gender", default: 1, null: false
    t.string "postcode", default: "", null: false
    t.integer "prefecture", default: 0, null: false
    t.string "address", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["first_name_kana"], name: "index_users_on_first_name_kana"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["last_name_kana"], name: "index_users_on_last_name_kana"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
