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

ActiveRecord::Schema.define(version: 20160725133649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "twitter"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start"
    t.datetime "finish"
    t.string   "title"
    t.text     "description"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "postcode"
    t.string   "eventbrite"
    t.string   "facebook"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "letter_authors", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "letter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_letter_authors_on_author_id", using: :btree
    t.index ["letter_id"], name: "index_letter_authors_on_letter_id", using: :btree
  end

  create_table "letter_recipients", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "letter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["letter_id"], name: "index_letter_recipients_on_letter_id", using: :btree
    t.index ["recipient_id"], name: "index_letter_recipients_on_recipient_id", using: :btree
  end

  create_table "letters", force: :cascade do |t|
    t.datetime "recieved"
    t.datetime "published"
    t.boolean  "is_draft"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json     "scans"
    t.string   "preview"
  end

  create_table "recipients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "description"
    t.datetime "born"
    t.string   "website"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "died"
  end

  add_foreign_key "letter_authors", "authors"
  add_foreign_key "letter_authors", "letters"
  add_foreign_key "letter_recipients", "letters"
  add_foreign_key "letter_recipients", "recipients"
end
