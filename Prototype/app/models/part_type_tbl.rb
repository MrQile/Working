class PART_TYPE_TBL < ExternalDbAccess
	self.table_name = "PART_TYPE_TBL"
	has_paper_trail class_name: 'Version'
end
