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

ActiveRecord::Schema.define(version: 2020_11_13_222025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "diet_meals", force: :cascade do |t|
    t.bigint "diet_id", null: false
    t.bigint "meal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "daytime"
    t.index ["diet_id"], name: "index_diet_meals_on_diet_id"
    t.index ["meal_id"], name: "index_diet_meals_on_meal_id"
  end

  create_table "diets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "weekdays", default: [], array: true
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.decimal "height"
    t.decimal "weight"
    t.decimal "imc"
    t.decimal "fat_rate"
    t.decimal "fat_weight"
    t.decimal "slim_weight"
    t.decimal "residual_weight"
    t.decimal "muscle_weight"
    t.decimal "triceps_skinfold"
    t.decimal "subscapular_skinfold"
    t.decimal "bicipital_skinfold"
    t.decimal "axilliary_skinfold"
    t.decimal "suprailiac_skinfold"
    t.decimal "thoracic_skinfold"
    t.decimal "abdominal_skinfold"
    t.decimal "medialcalf_skinfold"
    t.decimal "fist_bone_diametre"
    t.decimal "femur_bone_diametre"
    t.datetime "evaluation_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "exercise_workouts", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "workout_id", null: false
    t.integer "serie_type"
    t.integer "serie_reps"
    t.integer "serie_rest"
    t.text "notes"
    t.json "series", default: {"0"=>{"reps"=>0, "weight"=>0, "time"=>0}, "1"=>{"reps"=>0, "weight"=>0, "time"=>0}, "2"=>{"reps"=>0, "weight"=>0, "time"=>0}, "3"=>{"reps"=>0, "weight"=>0, "time"=>0}, "4"=>{"reps"=>0, "weight"=>0, "time"=>0}}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_exercise_workouts_on_exercise_id"
    t.index ["workout_id"], name: "index_exercise_workouts_on_workout_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_nutrients", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "nutrient_id", null: false
    t.decimal "quantity"
    t.string "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_food_nutrients_on_food_id"
    t.index ["nutrient_id"], name: "index_food_nutrients_on_nutrient_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meal_foods", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "food_id", null: false
    t.decimal "quantity"
    t.string "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_meal_foods_on_food_id"
    t.index ["meal_id"], name: "index_meal_foods_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.integer "daytime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.decimal "shoulder"
    t.decimal "pecs"
    t.decimal "right_arm"
    t.decimal "left_arm"
    t.decimal "right_forearm"
    t.decimal "left_forearm"
    t.decimal "waist"
    t.decimal "hip"
    t.decimal "right_leg"
    t.decimal "left_leg"
    t.decimal "right_twin"
    t.decimal "left_twin"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_measurements_on_user_id"
  end

  create_table "nutrients", force: :cascade do |t|
    t.string "name"
    t.integer "component_group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "tracking_logs", force: :cascade do |t|
    t.string "event_type"
    t.integer "trackeable_id"
    t.string "trackeable_type"
    t.integer "user_id"
    t.string "ip_address"
    t.json "metadata", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trackeable_id", "trackeable_type"], name: "index_tracking_logs_on_trackeable_id_and_trackeable_type"
    t.index ["user_id"], name: "index_tracking_logs_on_user_id"
  end

  create_table "user_diets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "diet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diet_id"], name: "index_user_diets_on_diet_id"
    t.index ["user_id"], name: "index_user_diets_on_user_id"
  end

  create_table "user_workouts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "workout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_workouts_on_user_id"
    t.index ["workout_id"], name: "index_user_workouts_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "surname"
    t.datetime "birth_date"
    t.string "dni"
    t.string "address"
    t.integer "phone"
    t.float "desired_weight"
    t.decimal "height"
    t.decimal "weight"
    t.integer "sex"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "weights", force: :cascade do |t|
    t.float "score"
    t.datetime "evaluation_date"
    t.text "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_weights_on_user_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "weekdays", default: [], array: true
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "diet_meals", "diets"
  add_foreign_key "diet_meals", "meals"
  add_foreign_key "diets", "users"
  add_foreign_key "evaluations", "users"
  add_foreign_key "exercise_workouts", "exercises"
  add_foreign_key "exercise_workouts", "workouts"
  add_foreign_key "food_nutrients", "foods"
  add_foreign_key "food_nutrients", "nutrients"
  add_foreign_key "meal_foods", "foods"
  add_foreign_key "meal_foods", "meals"
  add_foreign_key "measurements", "users"
  add_foreign_key "user_diets", "diets"
  add_foreign_key "user_diets", "users"
  add_foreign_key "user_workouts", "users"
  add_foreign_key "user_workouts", "workouts"
  add_foreign_key "weights", "users"
  add_foreign_key "workouts", "users"
end
