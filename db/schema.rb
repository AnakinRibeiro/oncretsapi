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

ActiveRecord::Schema.define(version: 2020_12_11_131612) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "street"
    t.string "number", limit: 20
    t.string "complement"
    t.string "district"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "addresseable_type"
    t.bigint "addresseable_id"
    t.index ["addresseable_type", "addresseable_id"], name: "index_addresses_on_addresseable_type_and_addresseable_id"
  end

  create_table "cables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "spreadsheet_id", null: false
    t.bigint "positions_cable_id", null: false
    t.string "identification", limit: 20
    t.float "length"
    t.integer "predicted_elongation"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "active_anchoring", default: 1
    t.integer "passive_anchoring", default: 1
    t.index ["positions_cable_id"], name: "index_cables_on_positions_cable_id"
    t.index ["spreadsheet_id"], name: "index_cables_on_spreadsheet_id"
  end

  create_table "cables_reviews_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "document_number"
    t.boolean "is_active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "constructions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_active", default: true
    t.index ["company_id"], name: "index_constructions_on_company_id"
  end

  create_table "constructions_activities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "construction_id", null: false
    t.bigint "activities_type_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activities_type_id"], name: "index_constructions_activities_on_activities_type_id"
    t.index ["construction_id"], name: "index_constructions_activities_on_construction_id"
    t.index ["user_id"], name: "index_constructions_activities_on_user_id"
  end

  create_table "elongations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "cable_id", null: false
    t.integer "elongation"
    t.integer "status"
    t.float "deviation"
    t.float "elongation_meter"
    t.bigint "cables_reviews_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "jacking_mode", default: 1
    t.integer "correction_value"
    t.boolean "wedgeslip_check", default: true
    t.integer "wedgeslip_value"
    t.index ["cable_id"], name: "index_elongations_on_cable_id"
    t.index ["cables_reviews_type_id"], name: "index_elongations_on_cables_reviews_type_id"
  end

  create_table "jacks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "identification", limit: 20
    t.string "name"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_jacks_on_company_id"
  end

  create_table "jacks_uses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "jack_id", null: false
    t.bigint "spreadsheet_id", null: false
    t.datetime "start"
    t.datetime "end"
    t.integer "elongations_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jack_id"], name: "index_jacks_uses_on_jack_id"
    t.index ["spreadsheet_id"], name: "index_jacks_uses_on_spreadsheet_id"
  end

  create_table "limits_elongations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.float "initial_length"
    t.float "final_length"
    t.float "inferior_limit"
    t.float "upper_limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phones", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "phones_type_id", null: false
    t.string "phone", limit: 30
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phonesable_type"
    t.bigint "phonesable_id"
    t.index ["phones_type_id"], name: "index_phones_on_phones_type_id"
    t.index ["phonesable_type", "phonesable_id"], name: "index_phones_on_phonesable_type_and_phonesable_id"
  end

  create_table "phones_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "positions_cables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "version", limit: 30
    t.bigint "construction_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["construction_id"], name: "index_projects_on_construction_id"
  end

  create_table "pumps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "identification"
    t.string "name"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_pumps_on_company_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles_assignments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_roles_assignments_on_role_id"
    t.index ["user_id"], name: "index_roles_assignments_on_user_id"
  end

  create_table "spreadsheets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "construction_id", null: false
    t.string "name"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "requester"
    t.string "resposible"
    t.string "comments"
    t.integer "cable_numbering_type", default: 0
    t.float "kg_m"
    t.float "tip_size"
    t.index ["construction_id"], name: "index_spreadsheets_on_construction_id"
  end

  create_table "spreadsheets_equipments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "spreadsheet_id", null: false
    t.bigint "pump_id", null: false
    t.bigint "jack_id", null: false
    t.datetime "start"
    t.datetime "end"
    t.integer "elongations_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jack_id"], name: "index_spreadsheets_equipments_on_jack_id"
    t.index ["pump_id"], name: "index_spreadsheets_equipments_on_pump_id"
    t.index ["spreadsheet_id"], name: "index_spreadsheets_equipments_on_spreadsheet_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id", null: false
    t.string "name"
    t.boolean "is_active", default: true
    t.bigint "role_id"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.date "birthdate"
    t.string "cellphone"
    t.string "language", default: "en"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "versions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "item_type", limit: 191, null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", size: :long
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cables", "positions_cables"
  add_foreign_key "cables", "spreadsheets"
  add_foreign_key "comments", "users"
  add_foreign_key "constructions", "companies"
  add_foreign_key "constructions_activities", "activities_types"
  add_foreign_key "constructions_activities", "constructions"
  add_foreign_key "constructions_activities", "users"
  add_foreign_key "elongations", "cables"
  add_foreign_key "elongations", "cables_reviews_types"
  add_foreign_key "jacks", "companies"
  add_foreign_key "jacks_uses", "jacks"
  add_foreign_key "jacks_uses", "spreadsheets"
  add_foreign_key "phones", "phones_types"
  add_foreign_key "projects", "constructions"
  add_foreign_key "pumps", "companies"
  add_foreign_key "roles_assignments", "users"
  add_foreign_key "spreadsheets", "constructions"
  add_foreign_key "spreadsheets_equipments", "jacks"
  add_foreign_key "spreadsheets_equipments", "pumps"
  add_foreign_key "spreadsheets_equipments", "spreadsheets"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "roles"
end
