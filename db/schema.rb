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

ActiveRecord::Schema.define(version: 20180331075852) do

  create_table "companies", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
    t.string  "incorporation_date"
    t.string  "incorporation_number"
    t.string  "company_type"
    t.string  "description"
    t.string  "team_strength"
    t.string  "location"
    t.string  "growth_rate"
    t.string  "pan"
    t.string  "contact_number"
    t.string  "website"
    t.string  "net_worth"
    t.string  "image"
    t.string  "profits"
  end

  create_table "department_employees", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "department_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "ministry_id"
  end

  create_table "eligibilities", force: :cascade do |t|
    t.text     "details"
    t.integer  "scheme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "bucket"
    t.integer  "value"
    t.float    "weight"
  end

  add_index "eligibilities", ["scheme_id"], name: "index_eligibilities_on_scheme_id"

  create_table "loan_requests", force: :cascade do |t|
    t.integer "user_id"
    t.float   "score"
    t.integer "scheme_id"
  end

  add_index "loan_requests", ["scheme_id"], name: "index_loan_requests_on_scheme_id"
  add_index "loan_requests", ["user_id"], name: "index_loan_requests_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "ticket_id"
  end

  add_index "messages", ["ticket_id"], name: "index_messages_on_ticket_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "ministries", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "schemes", force: :cascade do |t|
    t.string   "name"
    t.text     "guidelines"
    t.string   "collateral"
    t.integer  "ticket_size"
    t.float    "interest_rate"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "schemes", ["department_id"], name: "index_schemes_on_department_id"

  create_table "tickets", force: :cascade do |t|
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
    t.integer  "status"
  end

  add_index "tickets", ["department_id"], name: "index_tickets_on_department_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                                null: false
    t.string   "password"
    t.integer  "role",                 default: 0,     null: false
    t.string   "name"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "reset_password_token", default: ""
    t.string   "access_token"
    t.boolean  "disabled",             default: false
    t.string   "image"
    t.string   "address"
    t.string   "phone"
  end

end
