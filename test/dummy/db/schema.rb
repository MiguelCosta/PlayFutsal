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

ActiveRecord::Schema.define(:version => 20120930181420) do

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

  create_table "play_auth_role_users", :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "play_auth_users", ["email"], :name => "index_play_auth_users_on_email", :unique => true
  add_index "play_auth_users", ["reset_password_token"], :name => "index_play_auth_users_on_reset_password_token", :unique => true

  create_table "play_futsal_athlete_stats", :force => true do |t|
    t.integer "match_id"
    t.integer "athlete_id"
    t.integer "goals",      :default => 0
    t.integer "fouls",      :default => 0
  end

  create_table "play_futsal_athletes", :force => true do |t|
    t.integer  "user_id",                   :null => false
    t.integer  "team_id"
    t.integer  "number"
    t.integer  "goals",      :default => 0
    t.integer  "fouls",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "play_futsal_event_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "play_futsal_events", :force => true do |t|
    t.integer  "match_id",         :null => false
    t.integer  "event_type_id",    :null => false
    t.integer  "athlete_id"
    t.integer  "other_athlete_id"
    t.integer  "minute"
    t.string   "desc"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "play_futsal_groups", :force => true do |t|
    t.string "name"
  end

  create_table "play_futsal_matches", :force => true do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "group_id"
    t.integer  "home_team_stats"
    t.integer  "away_team_stats"
    t.string   "desc"
    t.datetime "datetime"
    t.boolean  "started",         :default => false
    t.boolean  "finished",        :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "play_futsal_stats", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "play_futsal_team_stats", :force => true do |t|
    t.integer "match_id"
    t.integer "team_id"
    t.integer "goals",    :default => 0
    t.integer "fouls",    :default => 0
  end

  create_table "play_futsal_teams", :force => true do |t|
    t.integer  "group_id"
    t.string   "name",                      :null => false
    t.integer  "goals",      :default => 0
    t.integer  "fouls",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
