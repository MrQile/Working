class SUBSYSTEM_TBL < ExternalDbAccess
	self.table_name = "SUBSYSTEM_TBL"
	has_many :base_cmd_tbls, class_name: "BASE_CMD_TBL", primary_key: "SUBSYSTEM_ID", foreign_key: "SUBSYSTEM", inverse_of: :subsystem_tbl
end
