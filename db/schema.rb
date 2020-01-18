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

ActiveRecord::Schema.define(version: 2020_01_18_131114) do

  create_table "candidate_skills", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "candidate_id"
    t.index ["candidate_id"], name: "index_candidate_skills_on_candidate_id"
    t.index ["skill_id"], name: "index_candidate_skills_on_skill_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "telephone"
    t.string "email"
    t.string "linked_in"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position_id"
    t.integer "recruiter_id"
    t.string "github"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "place"
    t.datetime "time"
    t.integer "recruiter_id"
    t.integer "candidate_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_meeting_tables_on_candidate_id"
    t.index ["recruiter_id"], name: "index_meeting_tables_on_recruiter_id"
  end

  create_table "position_skills", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "position_id"
    t.index ["position_id"], name: "index_position_skills_on_position_id"
    t.index ["skill_id"], name: "index_position_skills_on_skill_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "requirements"
    t.text "responsibilities"
  end

  create_table "recruiter_skills", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "recruiter_id"
    t.index ["recruiter_id"], name: "index_recruiter_skills_on_recruiter_id"
    t.index ["skill_id"], name: "index_recruiter_skills_on_skill_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "telephone"
    t.string "email"
    t.string "linked_in"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "skill_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "candidate_skills", "candidates"
  add_foreign_key "candidate_skills", "skills"
  add_foreign_key "meeting_tables", "candidates"
  add_foreign_key "meeting_tables", "recruiters"
  add_foreign_key "position_skills", "positions"
  add_foreign_key "position_skills", "skills"
  add_foreign_key "recruiter_skills", "recruiters"
  add_foreign_key "recruiter_skills", "skills"
end
