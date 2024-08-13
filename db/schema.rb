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

ActiveRecord::Schema[7.1].define(version: 2024_08_13_083954) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "estimate_detail_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "estimate_detail_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "estimate_detail_desc_idx"
  end

  create_table "estimate_details", force: :cascade do |t|
    t.string "title"
    t.decimal "unit_price"
    t.decimal "amount"
    t.bigint "estimate_id", null: false
    t.integer "order_number"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estimate_id"], name: "index_estimate_details_on_estimate_id"
  end

  create_table "estimates", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "estimate_details", "estimates"
end
