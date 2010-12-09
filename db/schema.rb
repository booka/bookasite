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

ActiveRecord::Schema.define(:version => 20101208230913) do

  create_table "activities", :force => true do |t|
    t.string   "action"
    t.string   "model"
    t.integer  "model_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.string   "title"
    t.string   "description",        :limit => 300
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.string   "asset_file_size"
    t.string   "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "description",  :limit => 1024
    t.string   "content_type", :limit => 64
    t.string   "properties"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boks", ["title"], :name => "index_boks_on_title"
  add_index "boks", ["type"], :name => "index_boks_on_type"

  create_table "pages", :force => true do |t|
    t.string   "title",      :limit => 300
    t.string   "slug",       :limit => 100
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug"

  create_table "projects", :force => true do |t|
    t.string   "title",       :limit => 300
    t.string   "description", :limit => 1024
    t.string   "properties",  :limit => 1024
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "roles"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
