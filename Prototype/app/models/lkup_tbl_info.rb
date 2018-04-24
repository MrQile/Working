class LKUP_TBL_INFO < ExternalDbAccess
	self.table_name = "LKUP_TBL_INFO"
	has_many :lkup_tbls, class_name: "LKUP_TBL", primary_key: "LKUP_TBL_NO", foreign_key: "LKUP_TBL_NO"
	# has_many :cmd_part_tbls, class_name: "CMD_PART_TBL", primary_key: "LKUP_TBL_NO", foreign_key: "RESOLUTION"
end
