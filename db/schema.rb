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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150724161849) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "event_notifications", force: :cascade do |t|
    t.string   "notification_type", limit: 255
    t.integer  "guest_id",          limit: 4
    t.integer  "event_id",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_id",          limit: 4
  end

  create_table "events", force: :cascade do |t|
    t.date     "date"
    t.string   "location",               limit: 255
    t.boolean  "active",                 limit: 1
    t.string   "title",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "partner_one",            limit: 255
    t.string   "partner_two",            limit: 255
    t.string   "venue_name",             limit: 255
    t.string   "venue_address_line_one", limit: 255
    t.string   "venue_address_line_two", limit: 255
    t.string   "venue_address_city",     limit: 255
    t.string   "venue_address_state",    limit: 255
    t.string   "venue_address_zip",      limit: 255
    t.string   "venue_address_country",  limit: 255
    t.integer  "primary_venue_photo",    limit: 4
    t.text     "venue_body",             limit: 65535
    t.text     "venue_directions",       limit: 65535
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "rsvp",       limit: 1, default: false
    t.integer  "event_id",   limit: 4
  end

  create_table "guests", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.boolean  "rsvp",                limit: 1
    t.boolean  "invited_to_ceremony", limit: 1,   default: false
    t.boolean  "invited_to_evening",  limit: 1,   default: false
    t.boolean  "vegetarian",          limit: 1,   default: false
    t.integer  "group_size",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id",            limit: 4
    t.integer  "event_id",            limit: 4
    t.string   "allergies",           limit: 255
    t.string   "music",               limit: 255
    t.boolean  "has_kids",            limit: 1,   default: false
    t.string   "partner_name",        limit: 255
    t.string   "kids_menu_choices",   limit: 255
    t.boolean  "partner_rsvp",        limit: 1,   default: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id",   limit: 4
  end

  create_table "sections", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.integer  "event_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_lists", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "event_id",     limit: 4
    t.integer  "task_list_id", limit: 4
    t.boolean  "completed",    limit: 1
    t.string   "description",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venue_photos", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.integer  "event_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
