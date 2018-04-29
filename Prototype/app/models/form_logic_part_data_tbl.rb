class FORM_LOGIC_PART_DATA_TBL < ExternalDbAccess
	self.table_name = "FORM_LOGIC_PART_DATA_TBL"
	has_paper_trail class_name: 'Version'
	self.primary_key = 'CMD_ID', 'PART_NO', 'LOGIC_LEVEL'
	belongs_to :base_cmd_tbl, class_name: "BASE_CMD_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID"
	belongs_to :part_type_tbl, class_name: "PART_TYPE_TBL", foreign_key: "PART_TYPE", primary_key: "PART_TYPE"
	belongs_to :form_logic_part_type_tbl, class_name: "FORM_LOGIC_PART_TYPE_TBL", foreign_key: "FORM_LOGIC_PART_TYPE", primary_key: "FORM_LOGIC_PART_TYPE"
end