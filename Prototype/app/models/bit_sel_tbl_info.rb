class BIT_SEL_TBL_INFO < ExternalDbAccess
	self.table_name = "BIT_SEL_TBL_INFO"
	has_many :bit_sel_tbls, class_name: "BIT_SEL_TBL", primary_key: "BIT_SEL_TBL_NO", foreign_key: "BIT_SEL_TBL_NO"
	# has_many :cmd_part_tbls, class_name: "CMD_PART_TBL", primary_key: "BIT_SEL_TBL_NO", foreign_key: "RESOLUTION"
end
