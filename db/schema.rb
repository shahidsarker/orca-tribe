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

ActiveRecord::Schema.define(version: 2018_09_10_032640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "opps", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.text "summary"
    t.integer "vol_request"
    t.boolean "recurrence"
    t.text "requirement"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "api_opp_id"
    t.bigint "org_id"
    t.index ["org_id"], name: "index_opps_on_org_id"
  end

  create_table "orgs", force: :cascade do |t|
    t.string "name"
    t.text "summary"
    t.string "address"
    t.string "website"
    t.string "thumbnail"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "api_org_id"
  end

  create_table "user_opps", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "opp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opp_id"], name: "index_user_opps_on_opp_id"
    t.index ["user_id"], name: "index_user_opps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "location", default: "", null: false
    t.string "avatar", default: "", null: false
    t.text "bio", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "opps", "orgs"
  add_foreign_key "user_opps", "opps"
  add_foreign_key "user_opps", "users"
end
