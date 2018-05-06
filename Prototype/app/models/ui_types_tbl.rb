class UI_TYPES_TBL < ExternalDbAccess
	self.table_name = "UI_TYPES_TBL"
	has_many :base_cmd_tbls, class_name: "BASE_CMD_TBL", primary_key: "UI_TYPE", foreign_key: "UI_TYPE", inverse_of: :ui_types_tbl, dependent: :destroy
	has_paper_trail class_name: 'Version'

	validates :UI_TYPE_ID, presence: true, numericality: { only_integer: true }, uniqueness: true
    validates :UI_TYPE, presence: true, length: { maximum: 32 }
end
