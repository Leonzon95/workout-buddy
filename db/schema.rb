# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_30_204353) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_workouts", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "workout_id", null: false
    t.index ["category_id"], name: "index_category_workouts_on_category_id"
    t.index ["workout_id"], name: "index_category_workouts_on_workout_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "reps"
    t.string "sets"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "workout_id"
  end

  create_table "scheduled_workouts", force: :cascade do |t|
    t.integer "workout_id", null: false
    t.integer "user_id", null: false
    t.datetime "start_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_scheduled_workouts_on_user_id"
    t.index ["workout_id"], name: "index_scheduled_workouts_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.boolean "is_private", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  add_foreign_key "category_workouts", "categories"
  add_foreign_key "category_workouts", "workouts"
  add_foreign_key "scheduled_workouts", "users"
  add_foreign_key "scheduled_workouts", "workouts"
end
