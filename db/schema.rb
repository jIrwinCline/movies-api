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

ActiveRecord::Schema.define(version: 2019_08_19_214945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.boolean "adult"
    t.bigint "budget"
    t.string "genres"
    t.string "homepage"
    t.string "imdb_id"
    t.string "original_language"
    t.string "original_title"
    t.text "overview"
    t.string "popularity"
    t.string "production_companies"
    t.string "production_countries"
    t.date "release_date"
    t.bigint "revenue"
    t.bigint "runtime"
    t.string "spoken_languages"
    t.string "status"
    t.string "tagline"
    t.string "title"
    t.boolean "video"
    t.string "vote_average"
    t.bigint "vote_count"
  end

end
