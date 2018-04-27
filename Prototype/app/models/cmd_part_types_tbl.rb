class CMD_PART_TYPES_TBL < ExternalDbAccess
	self.table_name = "CMD_PART_TYPES_TBL"
	has_many :cmd_part_tbls, class_name: "CMD_PART_TBL", foreign_key: "CMD_PART_TYPE", primary_key: "CMD_PART_TYPE"
	has_paper_trail class_name: 'Version'
end
