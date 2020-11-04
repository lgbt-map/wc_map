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

ActiveRecord::Schema.define(version: 2020_11_02_060833) do

  create_table "coordinates", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.string "memo", default: "-----"
    t.string "address"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "coordinate_id"
    t.float "cleanliness", default: 0.0
    t.float "breadth", default: 0.0
    t.float "luxury", default: 0.0
    t.float "use_rate", default: 0.0
    t.float "security", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.integer "coordinate_id"
    t.boolean "toilet_jp", default: false
    t.boolean "toilet_west", default: false
    t.boolean "washlet", default: false
    t.boolean "powder_room", default: false
    t.boolean "changing_table", default: false
    t.boolean "wheelchair", default: false
    t.boolean "ostomate", default: false
    t.boolean "gender_separation", default: false
    t.boolean "can_everyone", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
