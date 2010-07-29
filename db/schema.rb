# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100727075900) do

  create_table "activity_notes", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "user_id"
    t.integer  "working_days",     :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "month"
    t.integer  "year"
    t.boolean  "validation_state", :default => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :null => false
    t.integer  "periode_travail"
    t.string   "function"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vacations", :force => true do |t|
    t.integer "user_id"
    t.integer "vacation_days", :default => 0
    t.integer "month"
    t.integer "year"
  end

end
