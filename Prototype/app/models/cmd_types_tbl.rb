class CMD_TYPES_TBL < ExternalDbAccess
	self.table_name = "CMD_TYPES_TBL"
	has_many :base_cmd_tbls, class_name: "BASE_CMD_TBL", primary_key: "CMD_TYPE", foreign_key: "CMD_TYPE", dependent: :destroy
	has_paper_trail class_name: 'Version'

	validates :CMD_TYPE_ID, presence: true, numericality: { only_integer: true }, uniqueness: true
    validates :CMD_TYPE, presence: true, length: { maximum: 32 }
    validates :CMD_TYPES_TBL_CMD_TYPE, presence: true, length: { maximum: 255 }

end