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

ActiveRecord::Schema.define(:version => 20111225093655) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_authors", :force => true do |t|
    t.integer  "book_id",    :limit => 255
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.integer  "goodreads_id", :null => false
    t.string   "isbn13"
    t.string   "title",        :null => false
    t.datetime "finished_at",  :null => false
    t.integer  "num_pages",    :null => false
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facts", :force => true do |t|
    t.integer  "facts_id"
    t.text     "content"
    t.datetime "created_at"
    t.integer  "category_id"
    t.string   "category_name"
    t.string   "category_permalink"
    t.datetime "updated_at"
  end

  create_table "github_actions", :force => true do |t|
    t.string   "github_id"
    t.string   "title"
    t.string   "permalink"
    t.datetime "published_at"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.string   "content"
    t.string   "permalink"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_mention"
  end

end
