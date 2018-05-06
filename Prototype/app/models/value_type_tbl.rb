class VALUE_TYPE_TBL < AllConfigAccess
	self.table_name = "VALUE_TYPE_TBL"
	has_paper_trail class_name: 'Version'
	validates :VALUE_TYPE, presence: true, uniqueness: true
end