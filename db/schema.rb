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

ActiveRecord::Schema.define(:version => 20110702132459) do

  create_table "clients", :force => true do |t|
    t.string   "client_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients_vendors", :id => false, :force => true do |t|
    t.integer "client_id", :null => false
    t.integer "vendor_id", :null => false
  end

  add_index "clients_vendors", ["client_id", "vendor_id"], :name => "index_clients_vendors_on_client_id_and_vendor_id", :unique => true

  create_table "vendors", :force => true do |t|
    t.string   "vendor_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
