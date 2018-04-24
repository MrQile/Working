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

ActiveRecord::Schema.define(version: 20180409182811) do

  create_table "BASE_CMD_TBL", primary_key: "CMD_ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "DESCRIPTION"
    t.integer "SUBSYSTEM"
    t.string "FORMATION_TYPE"
    t.string "CMD_TYPE"
    t.string "BASE_CMD_CODE"
    t.string "BASE_CMD_MASK"
    t.string "CRITICALITY"
    t.string "PULSE_WIDTH"
    t.string "MAP_ID"
    t.integer "UI_TYPE"
    t.string "PREFERRABLE_DECODER"
    t.string "CONFIRMATION_TYPE"
    t.string "REMARKS"
    t.index ["CMD_TYPE"], name: "CMD_TYPE"
    t.index ["SUBSYSTEM"], name: "SUBSYSTEM"
    t.index ["UI_TYPE"], name: "UI_TYPE"
  end

  create_table "BIT_SEL_TBL", primary_key: ["BIT_SEL_TBL_NO", "FIELD_NO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "BIT_SEL_TBL_NO", null: false
    t.float "FIELD_NO", limit: 53, null: false
    t.float "START_BIT", limit: 53
    t.string "NO_OF_BITS"
    t.string "BIT_MASK"
    t.string "VALUE"
    t.string "FIELD_MNEMONICS"
    t.string "VALUE_MNEMONICS"
    t.string "LOGICAL_OP"
  end

  create_table "BIT_SEL_TBL_INFO", primary_key: "BIT_SEL_TBL_NO", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "BIT_SEL_TBL_NAME"
  end

  create_table "CMD_PART_TBL", primary_key: ["CMD_ID", "CMD_PART_NO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "CMD_ID", null: false
    t.string "CMD_PART_NO", null: false
    t.string "CMD_PART_MNEMONIC"
    t.string "CMD_PART_TYPE"
    t.string "START_BIT"
    t.string "NO_OF_BITS"
    t.string "PART_MASK"
    t.string "RESOLUTION"
    t.string "OFFSET"
    t.string "INPUT_FORMAT"
    t.string "LL"
    t.string "UL"
    t.string "UNITS"
    t.string "REMARKS"
    t.index ["CMD_PART_TYPE"], name: "CMD_PART_TYPE"
  end

  create_table "CMD_PART_TYPES_TBL", primary_key: "CMD_PART_TYPE_ID", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "CMD_PART_TYPE"
  end

  create_table "CMD_TYPES_TBL", primary_key: "CMD_TYPE_ID", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "CMD_TYPE"
    t.string "CMD_TYPES_TBL_CMD_TYPE"
  end

  create_table "CONFIRMER_TBL", primary_key: "POSITION", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "NAME"
  end

  create_table "CPID_TBL", primary_key: ["CMD_ID", "CPID"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "CMD_ID", null: false
    t.string "CPID", null: false
    t.string "CPID_DESC"
    t.string "TM_VAL"
    t.string "TM_COUNT"
    t.string "PROC_TYPE"
  end

  create_table "EXPRESSION", primary_key: "EXPR_ID", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "EXPR_TYPE"
    t.string "TM_PID"
    t.string "REL_OP"
    t.string "VALUE"
    t.string "VALUE_TYPE"
  end

  create_table "LKUP_TBL", primary_key: ["LKUP_TBL_NO", "LKUP_ENTRY_INDEX"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "LKUP_TBL_NO", null: false
    t.string "LKUP_ENTRY_INDEX", null: false
    t.string "BYTE_CODE"
    t.string "VALUE"
  end

  create_table "LKUP_TBL_INFO", primary_key: "LKUP_TBL_NO", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "LKUP_TBL_NAME"
    t.string "LKUP_TBL_TYPE"
  end

  create_table "PREREQ_CONF_EXPR_TBL", primary_key: ["CMD_ID", "ENTRY_TYPE", "FIELD_NO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "CMD_ID", null: false
    t.string "ENTRY_TYPE", null: false
    t.integer "FIELD_NO", null: false
    t.integer "EXPR_ID"
    t.string "LOGICAL_OP"
    t.index ["EXPR_ID"], name: "EXPR_ID"
  end

  create_table "SUBSYSTEM_TBL", primary_key: "SUBSYSTEM_ID", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "SUBSYSTEM_NAME"
  end

  create_table "UI_TYPES_TBL", primary_key: "UI_TYPE_ID", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "UI_TYPE"
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "item_type", limit: 191, null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 4294967295
    t.datetime "created_at"
    t.text "object_changes", limit: 4294967295
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "BASE_CMD_TBL", "CMD_TYPES_TBL", column: "CMD_TYPE", primary_key: "CMD_TYPE_ID", name: "BASE_CMD_TBL_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "BASE_CMD_TBL", "SUBSYSTEM_TBL", column: "SUBSYSTEM", primary_key: "SUBSYSTEM_ID", name: "BASE_CMD_TBL_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "BASE_CMD_TBL", "UI_TYPES_TBL", column: "UI_TYPE", primary_key: "UI_TYPE_ID", name: "BASE_CMD_TBL_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "BIT_SEL_TBL", "BIT_SEL_TBL_INFO", column: "BIT_SEL_TBL_NO", primary_key: "BIT_SEL_TBL_NO", name: "BIT_SEL_TBL_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "CMD_PART_TBL", "BASE_CMD_TBL", column: "CMD_ID", primary_key: "CMD_ID", name: "CMD_PART_TBL_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "CMD_PART_TBL", "CMD_PART_TYPES_TBL", column: "CMD_PART_TYPE", primary_key: "CMD_PART_TYPE_ID", name: "CMD_PART_TBL_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "CPID_TBL", "BASE_CMD_TBL", column: "CMD_ID", primary_key: "CMD_ID", name: "CPID_TBL_ibfk_1"
  add_foreign_key "LKUP_TBL", "LKUP_TBL_INFO", column: "LKUP_TBL_NO", primary_key: "LKUP_TBL_NO", name: "LKUP_TBL_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "PREREQ_CONF_EXPR_TBL", "BASE_CMD_TBL", column: "CMD_ID", primary_key: "CMD_ID", name: "PREREQ_CONF_EXPR_TBL_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "PREREQ_CONF_EXPR_TBL", "EXPRESSION", column: "EXPR_ID", primary_key: "EXPR_ID", name: "PREREQ_CONF_EXPR_TBL_ibfk_1", on_update: :cascade, on_delete: :cascade
end
