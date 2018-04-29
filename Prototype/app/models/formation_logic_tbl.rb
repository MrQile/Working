class FORMATION_LOGIC_TBL < ExternalDbAccess
	self.table_name = "FORMATION_LOGIC_TBL"
	has_paper_trail class_name: 'Version'
end