class REL_OP_TBL < ExternalDbAccess
	self.table_name = "REL_OP_TBL"
	has_paper_trail class_name: 'Version'
end