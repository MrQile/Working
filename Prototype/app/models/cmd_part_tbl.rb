class CMD_PART_TBL < ExternalDbAccess
	has_paper_trail class_name: 'Version'
	self.table_name = "CMD_PART_TBL"
	self.primary_key = 'CMD_ID', 'CMD_PART_NO'
	belongs_to :base_cmd_tbl, class_name: "BASE_CMD_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID"
	belongs_to :cmd_part_types_tbl, class_name: "CMD_PART_TYPES_TBL", foreign_key: "CMD_PART_TYPE", primary_key: "CMD_PART_TYPE_ID"
	# belongs_to :bit_sel_tbl_info, class_name: "BIT_SEL_TBL_INFO", foreign_key: "RESOLUTION", primary_key: "BIT_SEL_TBL_NO"
	# belongs_to :lkup_tbl_info, class_name: "LKUP_TBL_INFO", foreign_key: "RESOLUTION", primary_key: "LKUP_TBL_NO"

end
