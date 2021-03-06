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

ActiveRecord::Schema.define(version: 20160403023742) do

  create_table "cardio_exercises", force: :cascade do |t|
    t.string   "cardio_exercise_name"
    t.integer  "time_minutes"
    t.integer  "calories_burned"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "tracker_id"
  end

  add_index "cardio_exercises", ["tracker_id"], name: "index_cardio_exercises_on_tracker_id"

  create_table "strength_exercises", force: :cascade do |t|
    t.string   "strength_exercise_name"
    t.integer  "sets"
    t.integer  "reps"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "weight"
    t.integer  "tracker_id"
  end

  add_index "strength_exercises", ["tracker_id"], name: "index_strength_exercises_on_tracker_id"

  create_table "trackers", force: :cascade do |t|
    t.date     "workout_date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "cardio_exercise_id"
    t.integer  "strength_exercise_id"
  end

  add_index "trackers", ["cardio_exercise_id"], name: "index_trackers_on_cardio_exercise_id"
  add_index "trackers", ["strength_exercise_id"], name: "index_trackers_on_strength_exercise_id"

end
