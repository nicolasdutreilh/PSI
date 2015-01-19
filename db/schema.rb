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

ActiveRecord::Schema.define(version: 20130816141705) do

  create_table "banks", force: true do |t|
    t.string   "identifier", null: false
    t.string   "name",       null: false
    t.text     "address",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banks", ["identifier"], name: "index_banks_on_identifier", unique: true, using: :btree

  create_table "clients", force: true do |t|
    t.string   "identifier",   null: false
    t.string   "name",         null: false
    t.string   "contact"
    t.text     "address",      null: false
    t.string   "phone",        null: false
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_code", null: false
  end

  add_index "clients", ["identifier"], name: "index_clients_on_identifier", unique: true, using: :btree

  create_table "invoice_payments", force: true do |t|
    t.integer  "invoice_id",                      null: false
    t.integer  "payment_rule_id",                 null: false
    t.boolean  "paid",            default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_payments", ["invoice_id", "payment_rule_id"], name: "index_invoice_payments_on_invoice_id_and_payment_rule_id", unique: true, using: :btree
  add_index "invoice_payments", ["invoice_id"], name: "index_invoice_payments_on_invoice_id", using: :btree
  add_index "invoice_payments", ["payment_rule_id"], name: "index_invoice_payments_on_payment_rule_id", using: :btree

  create_table "invoices", force: true do |t|
    t.integer  "recipient_id",                            null: false
    t.string   "recipient_type",                          null: false
    t.string   "identifier",                              null: false
    t.decimal  "amount",         precision: 10, scale: 2, null: false
    t.date     "ordered_at",                              null: false
    t.date     "shipped_at"
    t.date     "invoiced_at"
    t.date     "delivered_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["identifier"], name: "index_invoices_on_identifier", unique: true, using: :btree
  add_index "invoices", ["recipient_id", "recipient_type"], name: "index_invoices_on_recipient_id_and_recipient_type", using: :btree

  create_table "payment_rules", force: true do |t|
    t.string   "name",                                                  null: false
    t.decimal  "percent",      precision: 10, scale: 0,                 null: false
    t.integer  "period",                                                null: false
    t.integer  "since",                                                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "end_of_month",                          default: false, null: false
  end

  add_index "payment_rules", ["percent", "period", "since"], name: "index_payment_rules_on_percent_and_period_and_since", unique: true, using: :btree

  create_table "suppliers", force: true do |t|
    t.string   "identifier",       null: false
    t.string   "name",             null: false
    t.text     "address",          null: false
    t.text     "shipping_address", null: false
    t.string   "contact_name"
    t.string   "contact_mail"
    t.string   "phone",            null: false
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_code",     null: false
  end

  add_index "suppliers", ["identifier"], name: "index_suppliers_on_identifier", unique: true, using: :btree

  create_table "target_payment_rules", force: true do |t|
    t.integer  "target_id",       null: false
    t.string   "target_type",     null: false
    t.integer  "payment_rule_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "target_payment_rules", ["payment_rule_id"], name: "index_target_payment_rules_on_payment_rule_id", using: :btree
  add_index "target_payment_rules", ["target_id", "target_type", "payment_rule_id"], name: "index_target_payment_rules_on_target_and_payment_rule", unique: true, using: :btree
  add_index "target_payment_rules", ["target_id", "target_type"], name: "index_target_payment_rules_on_target_id_and_target_type", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
