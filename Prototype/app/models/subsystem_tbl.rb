class SUBSYSTEM_TBL < ExternalDbAccess
	self.table_name = "SUBSYSTEM_TBL"
	has_many :base_cmd_tbls, class_name: "BASE_CMD_TBL", primary_key: "SUBSYSTEM", foreign_key: "SUBSYSTEM", inverse_of: :subsystem_tbl
	has_paper_trail class_name: 'Version'
end
