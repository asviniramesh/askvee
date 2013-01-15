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

ActiveRecord::Schema.define(:version => 20120626100746) do

  create_table "accomodation_green_profiles", :force => true do |t|
    t.integer  "accomodation_id"
    t.text     "green_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "amenities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "break_fasts", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], :name => "index_categories_on_name"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commission_fixings", :force => true do |t|
    t.integer  "percentage"
    t.boolean  "host_from_franchisee"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_details", :force => true do |t|
    t.integer  "profile_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.date     "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "room_booking_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "role_type"
    t.integer  "rating"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "green_profiles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.string   "area_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  create_table "messages", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.boolean  "is_read",     :default => false
    t.boolean  "is_trash",    :default => false
    t.string   "status"
    t.string   "category"
  end

  create_table "payments", :force => true do |t|
    t.integer  "room_booking_id"
    t.string   "type_of_card"
    t.text     "card_number"
    t.date     "expiry_date"
    t.string   "cvv_number"
    t.string   "name_as_on_card"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "amount"
    t.boolean  "is_refund",             :default => false
    t.string   "transaction_id"
    t.string   "refund_transaction_id"
  end

  create_table "post_ads", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "access_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.string   "property_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "accomodation_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_amenities", :force => true do |t|
    t.integer  "room_id"
    t.integer  "amenity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_bookings", :force => true do |t|
    t.integer  "room_id"
    t.integer  "guest_id"
    t.date     "check_in"
    t.date     "check_out"
    t.integer  "no_of_person"
    t.integer  "no_of_days"
    t.boolean  "is_amount_paid"
    t.float    "actual_rate"
    t.boolean  "is_accepted",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comments"
    t.integer  "host_id"
    t.boolean  "is_unavailable", :default => false
  end

  create_table "room_green_profiles", :force => true do |t|
    t.integer  "room_id"
    t.integer  "green_profile_id"
    t.boolean  "is_yes",           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.integer  "host_id"
    t.string   "name"
    t.string   "address"
    t.string   "room_type"
    t.text     "description"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "location_id"
    t.string   "area_code"
    t.float    "price"
    t.boolean  "is_available",         :default => true
    t.boolean  "is_approved",          :default => false
    t.integer  "approver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
    t.integer  "category_id"
    t.string   "visiting_location"
    t.string   "category_type"
    t.string   "type"
    t.boolean  "is_specific_location"
    t.string   "currency"
    t.integer  "accommodates"
    t.integer  "property_id"
    t.integer  "length"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_categories", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "address"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.integer  "location_id"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "area_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.text     "uid"
    t.boolean  "is_accepted",                           :default => false
    t.boolean  "is_rejected",                           :default => false
    t.string   "permalink"
    t.integer  "parent_id"
    t.string   "state_name"
    t.string   "city_name"
    t.string   "addressline2"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
