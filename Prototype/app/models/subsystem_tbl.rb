class SUBSYSTEM_TBL < ExternalDbAccess
	self.table_name = "SUBSYSTEM_TBL"
	has_many :base_cmd_tbls, class_name: "BASE_CMD_TBL", primary_key: "SUBSYSTEM_NAME", foreign_key: "SUBSYSTEM", inverse_of: :subsystem_tbl, dependent: :destroy
	has_paper_trail class_name: 'Version'

	validates :SUBSYSTEM_ID, presence: true, numericality: { only_integer: true }, uniqueness: true
    validates :SUBSYSTEM_NAME, presence: true, length: { maximum: 16 }
    validates :SUBSYSTEM_SHORT_NAME, presence: true, length: { maximum: 3 }
end