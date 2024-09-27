# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_26_180830) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dog_schedules", force: :cascade do |t|
    t.integer "dog_id"
    t.boolean "monday_morning"
    t.boolean "monday_afternoon"
    t.boolean "tuesday_morning"
    t.boolean "tuesday_afternoon"
    t.boolean "wednesday_morning"
    t.boolean "wednesday_afternoon"
    t.boolean "thursday_morning"
    t.boolean "thursday_afternoon"
    t.boolean "friday_morning"
    t.boolean "friday_afternoon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "dog_id"
    t.date "schedule_date"
    t.boolean "morning"
    t.boolean "afternoon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "walkers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
