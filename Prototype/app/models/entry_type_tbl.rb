class ENTRY_TYPE_TBL < ExternalDbAccess
	self.table_name = "ENTRY_TYPE_TBL"
	has_paper_trail class_name: 'Version'
end