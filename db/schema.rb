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

ActiveRecord::Schema[7.0].define(version: 2023_06_05_051119) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verifi_cells", force: :cascade do |t|
    t.bigint "verifi_image_result_id", null: false
    t.float "sexual_activity"
    t.float "sexual_display"
    t.float "erotica"
    t.float "drugs"
    t.float "gore"
    t.integer "x_coor"
    t.integer "y_coor"
    t.integer "row"
    t.integer "col"
    t.string "photo_url"
    t.string "profanity_type"
    t.string "profanity_match"
    t.string "profanity_intensity"
    t.boolean "checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["verifi_image_result_id"], name: "index_verifi_cells_on_verifi_image_result_id"
  end

  create_table "verifi_comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "verifi_post_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_verifi_comments_on_user_id"
    t.index ["verifi_post_id"], name: "index_verifi_comments_on_verifi_post_id"
  end

  create_table "verifi_image_results", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "nudity"
    t.float "sexual_activity"
    t.float "sexual_display"
    t.float "erotica"
    t.float "suggestive"
    t.float "drugs"
    t.float "gore"
    t.string "profanity_type"
    t.string "profanity_match"
    t.string "profanity_intensity"
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_verifi_image_results_on_user_id"
  end

  create_table "verifi_notifications", force: :cascade do |t|
    t.string "title"
    t.boolean "unread"
    t.bigint "user_id", null: false
    t.bigint "verifi_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_verifi_notifications_on_user_id"
    t.index ["verifi_post_id"], name: "index_verifi_notifications_on_verifi_post_id"
  end

  create_table "verifi_posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_verifi_posts_on_user_id"
  end

  add_foreign_key "verifi_cells", "verifi_image_results"
  add_foreign_key "verifi_comments", "users"
  add_foreign_key "verifi_comments", "verifi_posts"
  add_foreign_key "verifi_image_results", "users"
  add_foreign_key "verifi_notifications", "users"
  add_foreign_key "verifi_notifications", "verifi_posts"
  add_foreign_key "verifi_posts", "users"
end
