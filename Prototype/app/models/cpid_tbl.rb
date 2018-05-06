class CPID_TBL < ExternalDbAccess
	has_paper_trail class_name: 'Version'
	self.table_name = "CPID_TBL"
	self.primary_key = 'CMD_ID', 'CPID'
	belongs_to :base_cmd_tbl, class_name: "BASE_CMD_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID"

	validates :CMD_ID, presence: true, length: { is: 8 }
    validates :CPID, presence: true, length: { maximum: 8 }
    validates :CPID_DESC, presence: true, length: { maximum: 20 }
    validates :TM_VAL, presence: true, length: { maximum: 255 }
    validates :TM_COUNT, presence: true, numericality: { only_integer: true }
    validates :PROC_TYPE, presence: true
	
end