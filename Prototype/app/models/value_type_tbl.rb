class VALUE_TYPE_TBL < ExternalDbAccess
	self.table_name = "VALUE_TYPE_TBL"
	has_paper_trail class_name: 'Version'
end