class MAP_ID_TBL < ExternalDbAccess
	self.table_name = "MAP_ID_TBL"
	has_paper_trail class_name: 'Version'
end
