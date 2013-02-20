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

ActiveRecord::Schema.define(:version => 20130219154808) do

  create_table "assets", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "assets", ["assetable_id", "assetable_type"], :name => "index_assets_on_assetable_id_and_assetable_type"

  create_table "coaches", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "games_won"
    t.integer  "games_lost"
    t.integer  "drawn_games"
    t.date     "date_of_birth"
    t.string   "trainer_status"
    t.text     "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "position"
    t.string   "citizenship"
    t.string   "former_clubs"
    t.integer  "user_id"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.text     "description"
    t.date     "date_of_birth"
    t.string   "position"
    t.string   "citizenship"
    t.integer  "yellow_card"
    t.integer  "red_card"
    t.float    "height"
    t.float    "weight"
    t.integer  "goals_scored"
    t.integer  "assists"
    t.integer  "minutes_played"
    t.integer  "number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
  end

  create_table "staffs", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.date     "date_of_birth"
    t.string   "position"
    t.string   "citizenship"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
  end

  create_table "tournaments", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
  end

  create_table "tournaments_users", :id => false, :force => true do |t|
    t.integer "tournament_id"
    t.integer "user_id"
  end

  add_index "tournaments_users", ["tournament_id"], :name => "index_tournaments_users_on_tournament_id"
  add_index "tournaments_users", ["user_id"], :name => "index_tournaments_users_on_user_id"

  create_table "users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "team_name"
    t.integer  "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
