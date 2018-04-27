class BIT_SEL_TBL < ExternalDbAccess
	self.table_name = "BIT_SEL_TBL"
	self.primary_key = 'BIT_SEL_TBL_NO', 'FIELD_NO'
	has_paper_trail class_name: 'Version'
	belongs_to :bit_sel_tbl_info, class_name: "BIT_SEL_TBL_INFO", primary_key: "BIT_SEL_TBL_NO", foreign_key: "BIT_SEL_TBL_NO"

end
