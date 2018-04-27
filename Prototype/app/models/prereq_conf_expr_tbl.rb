class PREREQ_CONF_EXPR_TBL < ExternalDbAccess
	self.table_name = "PREREQ_CONF_EXPR_TBL"
	self.primary_keys = 'CMD_ID', 'ENTRY_TYPE', 'FIELD_NO'
	belongs_to :base_cmd_tbl, class_name: "BASE_CMD_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID"
	belongs_to :expression, class_name: "EXPRESSION", foreign_key: "EXPR_ID", primary_key: "EXPR_ID"
	has_paper_trail class_name: 'Version'
end