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

ActiveRecord::Schema.define(:version => 20110502204718) do

  create_table "activities", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.boolean  "notified",                     :default => false
    t.string   "action",        :limit => 64
    t.string   "url",           :limit => 300
    t.string   "link",          :limit => 200
    t.datetime "created_at"
    t.datetime "activity_at"
  end

  create_table "app_vars", :force => true do |t|
    t.string   "name",       :limit => 64
    t.integer  "count",                    :default => 0
    t.integer  "value",                    :default => 0
    t.string   "data",       :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.string   "title"
    t.string   "description",   :limit => 300
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "rol",           :limit => 16
    t.string   "file"
    t.integer  "resource_id"
    t.string   "resource_type", :limit => 64
  end

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boks", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "position"
    t.string   "type",         :limit => 32
    t.string   "title",        :limit => 300
    t.string   "authors",      :limit => 300
    t.string   "description",  :limit => 1024
    t.string   "content_type", :limit => 64
    t.string   "properties"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.string   "parent_type",  :limit => 32
    t.string   "ancestry"
  end

  add_index "boks", ["ancestry"], :name => "index_boks_on_ancestry"
  add_index "boks", ["title"], :name => "index_boks_on_title"
  add_index "boks", ["type"], :name => "index_boks_on_type"

  create_table "jobs", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "bok_id"
    t.string   "bok_type"
    t.string   "name",        :limit => 100
    t.string   "options",     :limit => 1024
    t.datetime "start_after"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "priority",                    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.boolean  "notified",    :default => false
    t.datetime "created_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title",        :limit => 300
    t.string   "slug",         :limit => 100
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_type", :limit => 64
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug"

  create_table "permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "level",      :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "title",         :limit => 300
    t.string   "description",   :limit => 1024
    t.string   "properties",    :limit => 1024
    t.string   "stage_content", :limit => 8,    :default => "closed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "serie_id",                      :default => 1
    t.integer  "user_id"
    t.string   "slug",          :limit => 200
  end

  add_index "projects", ["slug"], :name => "index_projects_on_slug"

  create_table "proposals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "rol",         :limit => 32
    t.string   "title",       :limit => 300
    t.string   "authors",     :limit => 300
    t.string   "description", :limit => 500
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file1"
    t.string   "file2"
    t.string   "file3"
    t.string   "file4"
  end

  create_table "series", :force => true do |t|
    t.string   "title",        :limit => 100
    t.string   "icon_path",    :limit => 256
    t.string   "content_type", :limit => 64
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "roles"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",      :limit => 300
    t.string   "avatar_url", :limit => 300
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",                :null => false
    t.integer  "item_id",                  :null => false
    t.string   "event",                    :null => false
    t.string   "whodunnit"
    t.string   "bok_type",   :limit => 16
    t.integer  "project_id"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
