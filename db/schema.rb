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

ActiveRecord::Schema.define(version: 20161203223055) do

  create_table "lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_lists_on_url", using: :btree
  end

  create_table "priorities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type",                      null: false
    t.text     "description", limit: 65535, null: false
    t.datetime "beginning",                 null: false
    t.datetime "ending",                    null: false
    t.float    "percentaje",  limit: 24,    null: false
    t.integer  "list_id"
    t.integer  "status_id"
    t.integer  "priority_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["list_id"], name: "index_tasks_on_list_id", using: :btree
    t.index ["priority_id"], name: "index_tasks_on_priority_id", using: :btree
    t.index ["status_id"], name: "index_tasks_on_status_id", using: :btree
  end

end
