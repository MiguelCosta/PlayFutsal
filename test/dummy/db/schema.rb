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

ActiveRecord::Schema.define(:version => 20120828133705) do

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "federations", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "federations", ["country_id"], :name => "index_federations_on_country_id"

  create_table "play_auth_authorizations", :force => true do |t|
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.integer  "user_id"
    t.string   "email"
    t.string   "token"
    t.string   "secret"
    t.string   "name"
    t.string   "link"
    t.string   "image_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "play_auth_roles", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "play_auth_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id"
  end

  add_index "play_auth_users", ["email"], :name => "index_play_auth_users_on_email", :unique => true
  add_index "play_auth_users", ["reset_password_token"], :name => "index_play_auth_users_on_reset_password_token", :unique => true

  create_table "play_futsal_athletes", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "number",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "play_futsal_federations", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "play_futsal_matches", :force => true do |t|
    t.integer  "home_team_id",                :null => false
    t.integer  "away_team_id",                :null => false
    t.integer  "home_score",   :default => 0, :null => false
    t.integer  "away_score",   :default => 0, :null => false
    t.string   "desc"
    t.datetime "datetime"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "play_futsal_team_athletes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "play_futsal_team_referees", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "play_futsal_team_staffs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "play_futsal_teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "play_futsal_tournament_federations", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "federation_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "play_futsal_tournament_federations", ["federation_id"], :name => "index_play_futsal_tournament_federations_on_federation_id"
  add_index "play_futsal_tournament_federations", ["tournament_id"], :name => "index_play_futsal_tournament_federations_on_tournament_id"

  create_table "play_futsal_tournaments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
