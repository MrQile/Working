class INPUT_FORMAT_TBL < AllConfigAccess
	self.table_name = "INPUT_FORMAT_TBL"
	has_paper_trail class_name: 'Version'
	validates :INPUT_FORMAT, presence: true, uniqueness: true
end