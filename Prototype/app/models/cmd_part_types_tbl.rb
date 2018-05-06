class CMD_PART_TYPES_TBL < AllConfigAccess
	self.table_name = "CMD_PART_TYPES_TBL"
	has_paper_trail class_name: 'Version'

	validates :CMD_PART_TYPE_ID, presence: true, uniqueness: true
    validates :CMD_PART_TYPE, presence: true, length: { maximum: 32 }, uniqueness: true
end