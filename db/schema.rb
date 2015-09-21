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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131217175215) do

  create_table "billings", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cardinfos", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "card_code"
    t.string   "card_number"
    t.string   "charge_id"
    t.string   "token"
    t.integer  "user_id"
    t.integer  "plan_id"
  end

  create_table "mappings", :force => true do |t|
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "list"
    t.string   "order_number"
    t.string   "seller_id"
    t.string   "product_id"
    t.string   "product_permalink"
    t.string   "email"
    t.string   "full_name"
    t.string   "price"
    t.string   "variants"
    t.string   "offer_code"
    t.string   "test"
    t.string   "custom_fields"
    t.string   "shipping_information"
    t.string   "is_recurring_charge"
    t.integer  "user_id"
    t.string   "is_preorder_authorization"
    t.string   "list_id"
  end

  create_table "pings", :force => true do |t|
    t.integer  "ping"
    t.date     "start_date"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plans", :force => true do |t|
    t.integer  "ping_count"
    t.string   "ping_charges"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "interval"
    t.string   "unique_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "mailchimp_user_id"
    t.string   "mailchimp_api_key"
    t.datetime "stripedate"
    t.string   "stripetoken"
    t.integer  "payment_plan_id"
    t.datetime "signupdate"
    t.integer  "subscriptioncount"
    t.string   "user_name"
    t.string   "expired"
    t.string   "fingerprint"
    t.date     "expiry_date"
    t.integer  "sent_day"
    t.string   "user_type",              :default => "none"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
