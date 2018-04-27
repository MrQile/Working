class LKUP_TBL < ExternalDbAccess
	self.table_name = "LKUP_TBL"
	self.primary_key = 'LKUP_TBL_NO', 'LKUP_ENTRY_INDEX'
	belongs_to :lkup_tbl_info, class_name: "LKUP_TBL_INFO", primary_key: "LKUP_TBL_NO", foreign_key: "LKUP_TBL_NO"
	has_paper_trail class_name: 'Version'
end
