# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# MAP_ID_TBL.create([{ MAP_ID: "MAPID_05", MAP_BIT: 1 },{ MAP_ID: "MAPID_06", MAP_BIT: 6 },{ MAP_ID: "MAPID_07", MAP_BIT: 6  },{ MAP_ID: "MAPID_08", MAP_BIT: 8 }])

# INPUT_FORMAT_TBL.create([{ INPUT_FORMAT: "BINARY" },{ INPUT_FORMAT: "CHAR_ARRAY_8" },{ INPUT_FORMAT: "IEEE1750_FLOAT" },{ INPUT_FORMAT: "IEEE1750_INT" },{ INPUT_FORMAT: "IEEE1750_LONG_FLOAT" },{ INPUT_FORMAT: "IEEE1750_LONG_INT" },{ INPUT_FORMAT: "IGNORE_FMT" },
#   { INPUT_FORMAT: "INT_HEXADECIMAL" },{ INPUT_FORMAT: "INT_SIGNED_DECIMAL" },{ INPUT_FORMAT: "REAL_UNSIGNED_DECIMAL" },{ INPUT_FORMAT: "INT_UNSIGNED_DECIMAL" },{ INPUT_FORMAT: "REAL_SIGNED_DECIMAL" }])

# PREFERRABLE_DECODER_TBL.create([{ PREFERRABLE_DECODER: "DCODR_ANY"},{ PREFERRABLE_DECODER: "DCODR1_ONLY"},{ PREFERRABLE_DECODER: "DCODR2_ONNY"}])

# CRITICALITY_TBL.create([{ CRITICALITY: "NO_CRIT" },{ CRITICALITY: "HW_CRIT" },{ CRITICALITY: "SW_CRIT" },{ CRITICALITY: "USED_UP" }])

# PULSE_WIDTH_TBL.create([{ PULSE_WIDTH: "PW_64" },{ PULSE_WIDTH: "PW_128" },{ PULSE_WIDTH: "PW_256" },{ PULSE_WIDTH: "PW_512" }])

# BASE_FORMATION_LOGIC_TBL.create([{ BASE_FORMATION_LOGIC: "HW_CMD"},{ BASE_FORMATION_LOGIC: "AOCE_1553"},{ BASE_FORMATION_LOGIC: "AOCE_RT_1553"},{ BASE_FORMATION_LOGIC: "TCP_DIRECT"},{ BASE_FORMATION_LOGIC: "TCP_BULK_UPLINK"},{ BASE_FORMATION_LOGIC: "TCP_DUMP"},
#   { BASE_FORMATION_LOGIC: "TCP_EDIT"},{ BASE_FORMATION_LOGIC: "TCP_DATA_CMD"},{ BASE_FORMATION_LOGIC: "RT_THRU_TCP_BULK_DATA"},{ BASE_FORMATION_LOGIC: "OBT_BULK_DATA"},{ BASE_FORMATION_LOGIC: "TT_BULK_DATA"},{ BASE_FORMATION_LOGIC: "CCB_BULK_DATA"}])

# LKUP_TBL_TYPE_TBL.create([{ LKUP_TBL_TYPE: "STRING_TYPE" },{ LKUP_TBL_TYPE: "REF_PID_TYPE" },{ LKUP_TBL_TYPE: "INTEGER_TYPE" },{ LKUP_TBL_TYPE: "TMC_TYPE" },{ LKUP_TBL_TYPE: "FLOAT_TYPE" }])

# LOGICAL_OP_TBL.create([{ LOGICAL_OP: "AND"},{ LOGICAL_OP: "OR"},{ LOGICAL_OP: "XOR"}])

# CONFIRMATION_TYPE_TBL.create([{ BIT_POSITION: 0,CONFIRMATION_TYPE: "CONF_NONE",BIT_VAL: 0 },
#   { BIT_POSITION: 1,CONFIRMATION_TYPE: "AUX_REG",BIT_VAL: 1 },
#   { BIT_POSITION: 2,CONFIRMATION_TYPE: "UPLINK_COUNTER",BIT_VAL: 2 },
#   { BIT_POSITION: 3,CONFIRMATION_TYPE: "SEG_TRANSFER_COUNTER",BIT_VAL: 4 },
#   { BIT_POSITION: 4,CONFIRMATION_TYPE: "RT_BULK_COUNTER",BIT_VAL: 8 },
#   { BIT_POSITION: 5,CONFIRMATION_TYPE: "BC_BULK_COUNTER",BIT_VAL: 16 },
#   { BIT_POSITION: 6,CONFIRMATION_TYPE: "RT_THRU_TCP_BULK_COUNTER",BIT_VAL: 32},
#   { BIT_POSITION: 7,CONFIRMATION_TYPE: "TM_PID",BIT_VAL: 64 },
#   { BIT_POSITION: 8,CONFIRMATION_TYPE: "CONF_CHECKSUM",BIT_VAL:  128},
#   { BIT_POSITION: -1,CONFIRMATION_TYPE: "CONF_ALL",BIT_VAL:  255}])

# CMD_PART_TYPES_TBL.create([{ CMD_PART_TYPE_ID: 1, CMD_PART_TYPE: "BIT_SEL_PART_TYPE" }, { CMD_PART_TYPE_ID: 2, CMD_PART_TYPE: "LKUP_PART_TYPE" }, { CMD_PART_TYPE_ID: 3, CMD_PART_TYPE: "USER_DATA_PART_TYPE" }, { CMD_PART_TYPE_ID: 4, CMD_PART_TYPE: "SHARED_PART_TYPE" }])

# SUBSYSTEM_TBL.create([{ SUBSYSTEM_ID: 1, SUBSYSTEM_NAME: "AOCE", SUBSYSTEM_SHORT_NAME: "AOC"},{ SUBSYSTEM_ID: 2, SUBSYSTEM_NAME: "AOCS", SUBSYSTEM_SHORT_NAME: "AOC"},{ SUBSYSTEM_ID: 3, SUBSYSTEM_NAME: "DTG", SUBSYSTEM_SHORT_NAME: "DTG"},{ SUBSYSTEM_ID: 4, SUBSYSTEM_NAME: "EED",SUBSYSTEM_SHORT_NAME: "EED"}])

# UI_TYPES_TBL.create([{ UI_TYPE_ID: 1, UI_TYPE: "GEN_ON_OFF_CMD_UI"},{ UI_TYPE_ID: 2, UI_TYPE: "USER_DATA_CMD_UI"},{ UI_TYPE_ID: 3, UI_TYPE: "BIT_SEL_CMD_UI"}])

# CMD_TYPES_TBL.create([{ CMD_TYPE_ID: 1, CMD_TYPE: "ON_OFF_CMD"},{ CMD_TYPE_ID: 2, CMD_TYPE: "USER_DATA_CMD"},{ CMD_TYPE_ID: 3, CMD_TYPE: "BIT_SEL_CMD"},{ CMD_TYPE_ID: 4, CMD_TYPE: "LKUP_CMD"}])

 # 100.times do |n|
 # 	cmd = rand(1..4000)
 # 	BASE_CMD_TBL.create!(CMD_ID: cmd,
 # 	DESCRIPTION: "water",
 #    SUBSYSTEM: "AOCE",
 #    FORMATION_TYPE: "water",
 #    CMD_TYPE: "BIT_SEL_CMD",
 #    BASE_CMD_CODE: "12",
 #    BASE_CMD_MASK: "12",
 #    CRITICALITY: "water",
 #    PULSE_WIDTH: "water",
 #    MAP_ID: "water",
 #    UI_TYPE:  "USER_DATA_CMD_UI",
 #    PREFERRABLE_DECODER: "water",
 #    CONFIRMATION_TYPE: 23,
 #    REMARKS: "water")
 # end

# FORM_LOGIC_PART_TYPE_TBL.create([{FORM_LOGIC_PART_TYPE: "CALVOL_MEAN"},{FORM_LOGIC_PART_TYPE: "CALVOL_NEG_CNT"},{FORM_LOGIC_PART_TYPE: "CALVOL_POS_CNT"},{FORM_LOGIC_PART_TYPE: "CMD_NUMBER"},
#     {FORM_LOGIC_PART_TYPE: "DELAY_DATA"},
#     {FORM_LOGIC_PART_TYPE: "EVENT_ANA_VALS"},{FORM_LOGIC_PART_TYPE: "EVENT_MASKS"},{FORM_LOGIC_PART_TYPE: "EVENT_OPRS"},{FORM_LOGIC_PART_TYPE: "EVENT_WORDS"},{FORM_LOGIC_PART_TYPE: "FIXED_CODE_CHOICE"},
#     {FORM_LOGIC_PART_TYPE: "REMOTE_ADDR"},{FORM_LOGIC_PART_TYPE: "REMOTE_DATA"},{FORM_LOGIC_PART_TYPE: "START_ENTRY_NO_DATA"},{FORM_LOGIC_PART_TYPE: "TERMINATE_CMD_NO"},
#     {FORM_LOGIC_PART_TYPE: "TERMINATE_CODE"},
#     {FORM_LOGIC_PART_TYPE: "TOTAL_NO_ENTRY_DATA"},{FORM_LOGIC_PART_TYPE: "TOTAL_NO_ENTRY_DATA_PLUS_ONE"},{FORM_LOGIC_PART_TYPE: "TOTAL_NO_ENTRY_DATA_TIMES_TWO"},
#     {FORM_LOGIC_PART_TYPE: "USER_DATA"}])

# FORMATION_LOGIC_TBL.create([{FORMATION_LOGIC: "HW_CMD_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "AOCE_1553_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "AOCE_RT_1553_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "TCP_DIRECT_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "TCP_BULK_UPLINK_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "TCP_DUMP_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "TCP_EDIT_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "TCP_DATA_CMD_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "MANUAL_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "OBT_HW_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "OBT_1553_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "OBT_CCB_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "OBT_MAC_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "TT_HW_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "TT_1553_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "TT_CCB_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "CCB_HW_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "CCB_1553_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "TCP_RT_1553_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "HTR_LIM_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "HTR_SNSR_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "HTR_EN_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "HTR_DIS_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "PRT_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "THRM_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "AOC_TM_PAR_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "AOCINFO_BULK_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "TCP_BAT_EVT_UPLINK_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "TCP_CALINFO_UPLINK_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "TCP_CALVOL_UPLINK_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "TCP_BULK_0_TT_UPLINK_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "EVT_BULK_UPLINK_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "TCP_SINGLE_UPLINK_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "ADDR_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "ADDR_DATA_SUB_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "DPSW_ENABLE_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "DPSW_DISABLE_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "MF_SELF_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "PIP_SELF_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "SEC_CLR_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "EVT_BULK_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "DWELL_BULK_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "DWELL_ADDR_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "TCP_MEM_VIEW_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "TCP_MEM_WRITE_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "TCP_MEM_WRITE_SUBLOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "TCP_PWR_1553_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "TCP_RT_1553_BASE4_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "FDS_BULK_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "FDS_BULK_SUBLOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "CCB_1553_TERM_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "TT_1553_TERM_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "OBT_1553_TERM_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "TCP_BULK_0_CCB_UPLINK_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "CCB_1553_AOCE_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "TT_1553_AOCE_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "OBT_1553_AOCE_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "PTM_BULK_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "AOCE_RT_1553_NO_TERM_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "RT_HW_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "RT_1553_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},
#     {FORMATION_LOGIC: "RT_1553_TERM_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "RT_1553_AOCE_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "TC_BUS_BULK_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "AOC_BUS_BULK_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "GEN_BULK_SUBLOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "TCP_RT_1553_BASE12_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "TCP_RT_1553_BASE16_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "AOCE_RT_1553_NO_TERM_B4_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "AOCE_RT_1553_NO_TERM_B12_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "AOCE_RT_1553_NO_TERM_B16_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "AOCE_RT_1553_BASE4_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "AOCE_RT_1553_BASE12_LOGIC",FORMATION_LOGIC_LEVEL: 1},
#     {FORMATION_LOGIC: "AOCE_RT_1553_BASE16_LOGIC",FORMATION_LOGIC_LEVEL: 1},{FORMATION_LOGIC: "OBT_1553_48B_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2},{FORMATION_LOGIC: "PIP_SELF_DATA_LOGIC",FORMATION_LOGIC_LEVEL: 2}])

# EXPR_TYPE_TBL.create([{ID: 1,EXPR_TYPE: "NUMBER"},{ID: 2, EXPR_TYPE: "STRING"}])

# VALUE_TYPE_TBL.create([{VALUE_TYPE: "STRING_TYPE"},{VALUE_TYPE: "FLOAT_TYPE"}])

# REL_OP_TBL.create([{REL_OP: "REL_EQUAL"},{REL_OP: "REL_NOT_EQUAL"},{REL_OP: "REL_GREAT"},{REL_OP: "REL_GREAT_EQUAL"},{REL_OP: "REL_LESS"},{REL_OP: "REL_LESS_EQUAL"}])

# ENTRY_TYPE_TBL.create([{ID: 1,ENTRY_TYPE: "PREREQ"},{ID: 2,ENTRY_TYPE: "CONF"}])