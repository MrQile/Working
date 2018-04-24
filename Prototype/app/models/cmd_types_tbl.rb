class CMD_TYPES_TBL < ExternalDbAccess
	self.table_name = "CMD_TYPES_TBL"
	has_many :base_cmd_tbls, class_name: "BASE_CMD_TBL", primary_key: "CMD_TYPE_ID", foreign_key: "CMD_TYPE"
end