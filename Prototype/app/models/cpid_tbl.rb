class CPID_TBL < ExternalDbAccess
	self.table_name = "CPID_TBL"
	self.primary_key = 'CMD_ID', 'CPID'
	belongs_to :base_cmd_tbl, class_name: "BASE_CMD_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID"
	has_paper_trail class_name: 'Version'
end
