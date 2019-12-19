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

ActiveRecord::Schema.define(version: 2015_01_30_135446) do

  create_table "plugins", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "version"
    t.string "wiki_url"
    t.datetime "released_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_plugins_on_name", unique: true
    t.index ["released_at"], name: "index_plugins_on_released_at"
  end

end
