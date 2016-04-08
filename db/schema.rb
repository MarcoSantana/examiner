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

ActiveRecord::Schema.define(version: 20160408163715) do

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "question_id", limit: 4
    t.integer  "quiz_id",     limit: 4
    t.string   "answer",      limit: 1
    t.boolean  "pending",     limit: 1
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["quiz_id"], name: "index_answers_on_quiz_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "answers_quizzes", force: :cascade do |t|
    t.integer  "answer_id",  limit: 4, null: false
    t.integer  "quiz_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "answers_quizzes", ["answer_id", "quiz_id"], name: "index_answers_quizzes_on_answer_id_and_quiz_id", using: :btree
  add_index "answers_quizzes", ["quiz_id", "answer_id"], name: "index_answers_quizzes_on_quiz_id_and_answer_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "distractors", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.string   "option",      limit: 1
    t.integer  "position",    limit: 3
    t.decimal  "difficulty",                precision: 5, scale: 4, default: 0.0
    t.boolean  "visible",     limit: 1,                             default: true
    t.boolean  "locked",      limit: 1,                             default: false
    t.text     "content",     limit: 65535
    t.boolean  "right",       limit: 1,                             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "distractors", ["question_id"], name: "index_distractors_on_question_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "question_id",     limit: 4
    t.integer  "size",            limit: 4
    t.string   "format",          limit: 255
    t.text     "additional_code", limit: 65535
    t.string   "description",     limit: 255
    t.boolean  "in_line",         limit: 1
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "file_name",       limit: 255
    t.boolean  "visible",         limit: 1,     default: false
    t.boolean  "locked",          limit: 1,     default: false
  end

  add_index "pictures", ["question_id"], name: "index_pictures_on_question_id", using: :btree
  add_index "pictures", ["user_id"], name: "index_pictures_on_user_id", using: :btree

  create_table "question_sets", force: :cascade do |t|
    t.integer  "subject_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.decimal  "difficulty",               precision: 5, scale: 4, default: 0.0
    t.boolean  "visible",    limit: 1,                             default: true
    t.boolean  "locked",     limit: 1,                             default: false
    t.integer  "position",   limit: 4
    t.text     "content",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_sets_quizzes", id: false, force: :cascade do |t|
    t.integer "question_set_id", limit: 4, null: false
    t.integer "quiz_id",         limit: 4, null: false
  end

  add_index "question_sets_quizzes", ["question_set_id", "quiz_id"], name: "index_question_sets_quizzes_on_question_set_id_and_quiz_id", using: :btree
  add_index "question_sets_quizzes", ["quiz_id", "question_set_id"], name: "index_question_sets_quizzes_on_quiz_id_and_question_set_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "question_set_id", limit: 4
    t.decimal  "difficulty",                    precision: 5, scale: 4, default: 0.0
    t.boolean  "visible",         limit: 1,                             default: true
    t.boolean  "locked",          limit: 1,                             default: false
    t.integer  "position",        limit: 4
    t.text     "content",         limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "value",                         precision: 3, scale: 2
  end

  add_index "questions", ["question_set_id"], name: "index_questions_on_question_set_id", using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.date     "application_date"
    t.decimal  "difficulty",                     precision: 5, scale: 4, default: 0.0
    t.boolean  "visible",          limit: 1,                             default: true
    t.boolean  "locked",           limit: 1,                             default: false
    t.text     "description",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration",         limit: 4
  end

  create_table "sub_subjects", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "subject_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "sub_subjects", ["subject_id"], name: "index_sub_subjects_on_subject_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "quizzes"
  add_foreign_key "answers", "users"
  add_foreign_key "distractors", "questions"
  add_foreign_key "pictures", "questions"
  add_foreign_key "pictures", "users"
  add_foreign_key "questions", "question_sets"
end
