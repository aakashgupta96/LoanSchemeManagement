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

ActiveRecord::Schema.define(version: 20180327080227) do

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eligibilities", force: :cascade do |t|
    t.text     "details"
    t.integer  "scheme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "eligibilities", ["scheme_id"], name: "index_eligibilities_on_scheme_id"

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "queries", force: :cascade do |t|
    t.text     "content"
    t.integer  "officer_id"
    t.integer  "applicant_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "queries", ["applicant_id"], name: "index_queries_on_applicant_id"
  add_index "queries", ["officer_id"], name: "index_queries_on_officer_id"

  create_table "schemes", force: :cascade do |t|
    t.string   "name"
    t.text     "guidelines"
    t.string   "collateral"
    t.integer  "ticket_size"
    t.float    "interest_rate"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "schemes", ["department_id"], name: "index_schemes_on_department_id"

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
  end

end
