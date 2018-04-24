class UI_TYPES_TBL < ExternalDbAccess
	self.table_name = "UI_TYPES_TBL"
	has_many :base_cmd_tbls, class_name: "BASE_CMD_TBL", primary_key: "UI_TYPE_ID", foreign_key: "UI_TYPE", inverse_of: :ui_types_tbl
end
