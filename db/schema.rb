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

ActiveRecord::Schema.define(version: 20141229075955) do

  create_table "bills", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "category_id",        limit: 4
    t.integer  "repeat_interval_id", limit: 4
    t.decimal  "amount",                         precision: 8, scale: 2
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "bills", ["category_id"], name: "index_bills_on_category_id", using: :btree
  add_index "bills", ["repeat_interval_id"], name: "index_bills_on_repeat_interval_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "label",      limit: 255, null: false
    t.string   "image",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "content",     limit: 65535
    t.integer  "entity_id",   limit: 4
    t.string   "entity_type", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "notes", ["entity_type", "entity_id"], name: "index_notes_on_entity_type_and_entity_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.boolean  "email",      limit: 1
    t.boolean  "sms",        limit: 1
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "payment_sources", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "type",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "payment_sources", ["user_id"], name: "index_payment_sources_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "bill_id",           limit: 4
    t.decimal  "amount",                      precision: 8, scale: 2
    t.integer  "payment_source_id", limit: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "payments", ["bill_id"], name: "index_payments_on_bill_id", using: :btree
  add_index "payments", ["payment_source_id"], name: "index_payments_on_payment_source_id", using: :btree

  create_table "repeat_intervals", force: :cascade do |t|
    t.string   "interval",   limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "label",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",            limit: 255
    t.string   "last_name",             limit: 255
    t.string   "email_address",         limit: 255, null: false
    t.string   "username",              limit: 255, null: false
    t.string   "avatar",                limit: 255
    t.string   "phone_number",          limit: 255
    t.string   "password",              limit: 255
    t.string   "password_confirmation", limit: 255
    t.string   "password_digest",       limit: 255, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_foreign_key "bills", "categories"
  add_foreign_key "bills", "repeat_intervals"
  add_foreign_key "notifications", "users"
  add_foreign_key "payment_sources", "users"
  add_foreign_key "payments", "bills"
  add_foreign_key "payments", "payment_sources"
end
