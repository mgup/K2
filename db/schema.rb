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

ActiveRecord::Schema.define(version: 20151014113015) do

  create_table "academic_degrees", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "academic_titles", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "citizenships", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "departments", force: :cascade do |t|
    t.integer  "main_department_id", limit: 4
    t.string   "name",               limit: 255
    t.string   "abbreviation",       limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "departments", ["main_department_id"], name: "index_departments_on_main_department_id", using: :btree

  create_table "direction_categories", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "directions", force: :cascade do |t|
    t.integer  "direction_category_id", limit: 4,   null: false
    t.string   "code",                  limit: 255
    t.string   "name",                  limit: 255
    t.string   "old_code",              limit: 255
    t.string   "old_qualification",     limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "directions", ["direction_category_id"], name: "fk_rails_8f62885d91", using: :btree

  create_table "education_documents", force: :cascade do |t|
    t.integer  "person_id",      limit: 4
    t.string   "person_type",    limit: 255
    t.integer  "direction_id",   limit: 4,   null: false
    t.string   "institution",    limit: 255, null: false
    t.string   "name",           limit: 255, null: false
    t.string   "series",         limit: 255
    t.string   "number",         limit: 255, null: false
    t.integer  "year_of_ending", limit: 4,   null: false
    t.string   "qualification",  limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "education_documents", ["direction_id"], name: "index_education_documents_on_direction_id", using: :btree

  create_table "education_levels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employee_categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "hr_foreign_languages", force: :cascade do |t|
    t.integer  "user_id",                 limit: 4, null: false
    t.integer  "language_id",             limit: 4, null: false
    t.integer  "language_proficiency_id", limit: 4, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "hr_foreign_languages", ["language_id"], name: "index_hr_foreign_languages_on_language_id", using: :btree
  add_index "hr_foreign_languages", ["language_proficiency_id"], name: "index_hr_foreign_languages_on_language_proficiency_id", using: :btree
  add_index "hr_foreign_languages", ["user_id"], name: "index_hr_foreign_languages_on_user_id", using: :btree

  create_table "hr_positions", force: :cascade do |t|
    t.integer  "department_id",    limit: 4, null: false
    t.integer  "qualification_id", limit: 4, null: false
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "hr_positions", ["department_id"], name: "index_hr_positions_on_department_id", using: :btree
  add_index "hr_positions", ["qualification_id"], name: "index_hr_positions_on_qualification_id", using: :btree
  add_index "hr_positions", ["user_id"], name: "index_hr_positions_on_user_id", using: :btree

  create_table "hr_qualifications", force: :cascade do |t|
    t.integer  "employee_category_id", limit: 4,   null: false
    t.string   "name",                 limit: 255, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "hr_qualifications", ["employee_category_id"], name: "index_hr_qualifications_on_employee_category_id", using: :btree

  create_table "language_proficiencies", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "marital_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "office_document_types", force: :cascade do |t|
    t.string   "prefix",     limit: 255, null: false
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "office_orders", force: :cascade do |t|
    t.integer  "document_type_id",      limit: 4,   null: false
    t.integer  "number",                limit: 4,   null: false
    t.string   "suffix",                limit: 255
    t.date     "date",                              null: false
    t.string   "title",                 limit: 255, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
  end

  add_index "office_orders", ["document_type_id"], name: "index_office_orders_on_document_type_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "relatives", force: :cascade do |t|
    t.integer  "person_id",       limit: 4
    t.string   "person_type",     limit: 255
    t.integer  "relationship_id", limit: 4,   null: false
    t.string   "name",            limit: 255
    t.integer  "year_of_birth",   limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "relatives", ["relationship_id"], name: "index_relatives_on_relationship_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",              limit: 255,                 null: false
    t.string   "authorizable_type", limit: 255
    t.integer  "authorizable_id",   limit: 4
    t.boolean  "system",                        default: false, null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "roles", ["authorizable_type", "authorizable_id"], name: "index_roles_on_authorizable_type_and_authorizable_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4, null: false
    t.integer "role_id", limit: 4, null: false
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

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
    t.string   "last_name",              limit: 255,              null: false
    t.string   "first_name",             limit: 255,              null: false
    t.string   "patronymic",             limit: 255
    t.date     "birthdate"
    t.string   "birthplace",             limit: 255
    t.integer  "sex",                    limit: 4,   default: 1,  null: false
    t.integer  "citizenship_id",         limit: 4
    t.integer  "education_level_id",     limit: 4
    t.integer  "academic_degree_id",     limit: 4
    t.integer  "academic_title_id",      limit: 4
    t.integer  "marital_status_id",      limit: 4
  end

  add_index "users", ["academic_degree_id"], name: "index_users_on_academic_degree_id", using: :btree
  add_index "users", ["academic_title_id"], name: "index_users_on_academic_title_id", using: :btree
  add_index "users", ["citizenship_id"], name: "index_users_on_citizenship_id", using: :btree
  add_index "users", ["education_level_id"], name: "index_users_on_education_level_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["marital_status_id"], name: "index_users_on_marital_status_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id",       limit: 4
    t.string  "foreign_key_name", limit: 255, null: false
    t.integer "foreign_key_id",   limit: 4
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      limit: 255,        null: false
    t.integer  "item_id",        limit: 4,          null: false
    t.string   "event",          limit: 255,        null: false
    t.string   "whodunnit",      limit: 255
    t.text     "object",         limit: 4294967295
    t.datetime "created_at"
    t.integer  "transaction_id", limit: 4
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree

  add_foreign_key "directions", "direction_categories"
  add_foreign_key "education_documents", "directions"
  add_foreign_key "hr_foreign_languages", "language_proficiencies"
  add_foreign_key "hr_foreign_languages", "languages"
  add_foreign_key "hr_foreign_languages", "users"
  add_foreign_key "hr_positions", "departments"
  add_foreign_key "hr_positions", "hr_qualifications", column: "qualification_id"
  add_foreign_key "hr_positions", "users"
  add_foreign_key "hr_qualifications", "employee_categories"
  add_foreign_key "office_orders", "office_document_types", column: "document_type_id"
  add_foreign_key "relatives", "relationships"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
  add_foreign_key "users", "academic_degrees"
  add_foreign_key "users", "academic_titles"
  add_foreign_key "users", "citizenships"
  add_foreign_key "users", "education_levels"
  add_foreign_key "users", "marital_statuses"
end
