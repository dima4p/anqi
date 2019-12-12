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

ActiveRecord::Schema.define(version: 2019_12_12_213320) do

  create_table "cards", force: :cascade do |t|
    t.integer "nid"
    t.integer "did"
    t.integer "ord"
    t.integer "mod"
    t.integer "usn"
    t.integer "type"
    t.integer "queue"
    t.integer "due"
    t.integer "ivl"
    t.integer "factor"
    t.integer "reps"
    t.integer "lapses"
    t.integer "left"
    t.integer "odue"
    t.integer "odid"
    t.integer "flags"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "col", force: :cascade do |t|
    t.integer "crt", null: false
    t.integer "mod", null: false
    t.integer "scm", null: false
    t.integer "ver", null: false
    t.integer "dty", null: false
    t.integer "usn", null: false
    t.integer "ls", null: false
    t.text "conf", null: false
    t.text "models", null: false
    t.text "decks", null: false
    t.text "dconf", null: false
    t.text "tags", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text "guid"
    t.integer "mid"
    t.integer "mod"
    t.integer "usn"
    t.text "tags"
    t.text "flds"
    t.integer "sfld"
    t.integer "csum"
    t.integer "flags"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
