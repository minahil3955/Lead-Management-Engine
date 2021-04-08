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

ActiveRecord::Schema.define(version: 2021_04_08_102417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "client_name"
    t.string "client_address"
    t.string "client_email"
    t.string "client_contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment_line"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "former_leads", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "phase_id"
    t.bigint "project_id"
    t.bigint "client_id"
    t.string "lead_name"
    t.string "platform"
    t.date "joining_date"
    t.integer "is_sale"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_former_leads_on_client_id"
    t.index ["phase_id"], name: "index_former_leads_on_phase_id"
    t.index ["project_id"], name: "index_former_leads_on_project_id"
    t.index ["user_id"], name: "index_former_leads_on_user_id"
  end

  create_table "phase_users", force: :cascade do |t|
    t.bigint "phase_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phase_id"], name: "index_phase_users_on_phase_id"
    t.index ["user_id"], name: "index_phase_users_on_user_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "phase_type"
    t.date "start_date"
    t.date "due_date"
    t.date "creation_date"
    t.integer "phase_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.string "project_assignee"
    t.date "transition_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "former_leads", "clients"
  add_foreign_key "former_leads", "phases"
  add_foreign_key "former_leads", "projects"
  add_foreign_key "former_leads", "users"
end
