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

ActiveRecord::Schema.define(version: 20170116072433) do

  create_table "group_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "wins"
    t.integer "losses"
    t.integer "draws"
    t.integer "total_games"
    t.integer "group_size"
    t.integer "user_id"
    t.index ["user_id"], name: "index_group_stats_on_user_id", using: :btree
  end

  create_table "hero_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "wins"
    t.integer "losses"
    t.integer "draws"
    t.integer "total_games"
    t.integer "hero"
    t.integer "user_id"
    t.index ["user_id"], name: "index_hero_stats_on_user_id", using: :btree
  end

  create_table "heros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "hero"
    t.integer "match_id"
    t.index ["match_id"], name: "index_heros_on_match_id", using: :btree
  end

  create_table "map_hero_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "wins"
    t.integer "losses"
    t.integer "draws"
    t.integer "total_games"
    t.integer "map"
    t.integer "hero"
    t.integer "user_id"
    t.index ["user_id"], name: "index_map_hero_stats_on_user_id", using: :btree
  end

  create_table "map_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "wins"
    t.integer "losses"
    t.integer "draws"
    t.integer "total_games"
    t.integer "map"
    t.integer "user_id"
    t.index ["user_id"], name: "index_map_stats_on_user_id", using: :btree
  end

  create_table "matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "map"
    t.integer  "rank"
    t.integer  "wld"
    t.text     "notes",                  limit: 65535
    t.string   "video_link"
    t.integer  "winstreak"
    t.integer  "losestreak"
    t.integer  "rank_change"
    t.integer  "user_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "group_size",                           default: 1
    t.boolean  "group_stats_updated",                  default: false
    t.boolean  "hero_stats_updated",                   default: false
    t.boolean  "map_stats_updated",                    default: false
    t.boolean  "map_hero_stats_updated",               default: false
    t.boolean  "time_stats_updated",                   default: false
    t.index ["user_id", "created_at"], name: "index_matches_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_matches_on_user_id", using: :btree
  end

  create_table "recommendations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "best_hero"
    t.integer  "worst_hero"
    t.integer  "best_time_period"
    t.integer  "worst_time_period"
    t.integer  "best_group"
    t.integer  "worst_group"
    t.integer  "most_played_map"
    t.integer  "least_played_map"
    t.integer  "best_map"
    t.integer  "worst_map"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_recommendations_on_user_id", using: :btree
  end

  create_table "summaries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "total_games"
    t.integer  "lowest_sr"
    t.integer  "highest_sr"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "draws"
    t.integer  "longest_win_streak"
    t.integer  "longest_lose_streak"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "time_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "wins"
    t.integer "losses"
    t.integer "draws"
    t.integer "total_games"
    t.integer "time_period"
    t.integer "user_id"
    t.index ["user_id"], name: "index_time_stats_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.string   "battletag"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "group_stats", "users"
  add_foreign_key "hero_stats", "users"
  add_foreign_key "heros", "matches"
  add_foreign_key "map_hero_stats", "users"
  add_foreign_key "map_stats", "users"
  add_foreign_key "matches", "users"
  add_foreign_key "recommendations", "users"
  add_foreign_key "time_stats", "users"
end
