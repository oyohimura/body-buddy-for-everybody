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

ActiveRecord::Schema[7.0].define(version: 2023_02_02_202459) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "max_students"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_batches_on_program_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "number"
    t.bigint "batch_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_lessons_on_batch_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "discipline"
    t.string "level"
    t.string "target"
    t.string "duration"
    t.bigint "teacher_id", null: false
    t.integer "price"
    t.text "descritpion"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_programs_on_teacher_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_reviews_on_program_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "slot_students", force: :cascade do |t|
    t.bigint "slot_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slot_id"], name: "index_slot_students_on_slot_id"
    t.index ["student_id"], name: "index_slot_students_on_student_id"
  end

  create_table "slots", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "access_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_slots_on_lesson_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "batch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["batch_id"], name: "index_students_on_batch_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.text "description"
    t.bigint "user_id", null: false
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batches", "programs"
  add_foreign_key "lessons", "batches"
  add_foreign_key "programs", "teachers"
  add_foreign_key "reviews", "programs"
  add_foreign_key "reviews", "users"
  add_foreign_key "slot_students", "slots"
  add_foreign_key "slot_students", "students"
  add_foreign_key "slots", "lessons"
  add_foreign_key "students", "batches"
  add_foreign_key "students", "users"
  add_foreign_key "teachers", "users"
end
