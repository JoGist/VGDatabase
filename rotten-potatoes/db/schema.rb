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

ActiveRecord::Schema.define(version: 20200417103811) do

  create_table "gioco_reviews", force: :cascade do |t|
    t.integer "utente_id"
    t.integer "gioco_serial_number"
    t.integer "valutazione"
    t.string "descrizione"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gioco_serial_number"], name: "index_reviews_on_videogiocos_id"
    t.index ["utente_id"], name: "index_reviews_on_user_id"
  end

  create_table "moviegoers", force: :cascade do |t|
    t.string "name"
    t.string "string"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "rating"
    t.string "description"
    t.datetime "release_date"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "potatoes"
    t.text "comments"
    t.integer "moviegoer_id"
    t.integer "movie_id"
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["moviegoer_id"], name: "index_reviews_on_moviegoer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videogiocos", force: :cascade do |t|
    t.integer "serial_number"
    t.string "titolo"
    t.string "sviluppatore"
    t.string "genere"
    t.string "piattaforma"
    t.integer "valutazione"
    t.datetime "anno_pubblicazione"
    t.string "img_cover"
    t.string "link_acquisto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
