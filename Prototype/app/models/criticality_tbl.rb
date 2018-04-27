class CRITICALITY_TBL < ExternalDbAccess
	self.table_name = "CRITICALITY_TBL"
	has_paper_trail class_name: 'Version'
end