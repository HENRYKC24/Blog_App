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

ActiveRecord::Schema.define(version: 2022_01_15_075141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 50
    t.date "date_of_birth"
    t.integer "escape_attempts"
    t.boolean "neutered", default: false
    t.decimal "weight_kg"
    t.integer "species_id"
    t.integer "owner_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "author_id"
    t.bigint "user_id", null: false
    t.integer "posts_id"
    t.bigint "post_id", null: false
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "author_id"
    t.bigint "user_id", null: false
    t.integer "posts_id"
    t.bigint "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "owners", id: :integer, default: nil, force: :cascade do |t|
    t.string "full_name", limit: 50
    t.integer "age"
    t.string "email", limit: 120
    t.index ["email"], name: "owners_email_asc"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "author_id"
    t.bigint "user_id", null: false
    t.string "title"
    t.text "text"
    t.integer "likes_counter"
    t.integer "comments_counter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "specializations", id: :integer, default: nil, force: :cascade do |t|
    t.integer "vets_id"
    t.integer "species_id"
  end

  create_table "species", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 50
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.text "bio"
    t.integer "posts_counter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vets", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 50
    t.integer "age"
    t.date "date_of_graduation"
  end

  create_table "visits", id: :integer, default: nil, force: :cascade do |t|
    t.integer "animals_id"
    t.integer "vets_id"
    t.date "date_of_visit"
    t.index ["vets_id"], name: "visits_vets_id_asc"
  end

  add_foreign_key "animals", "owners", name: "fk_name2"
  add_foreign_key "animals", "species", name: "fk_name"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "specializations", "species", name: "species_fk"
  add_foreign_key "specializations", "vets", column: "vets_id", name: "vet_fk"
  add_foreign_key "visits", "animals", column: "animals_id", name: "animals_fk"
  add_foreign_key "visits", "vets", column: "vets_id", name: "vet_fk"
end
