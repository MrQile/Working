class REL_OP_TBL < AllConfigAccess
	self.table_name = "REL_OP_TBL"
	has_paper_trail class_name: 'Version'
	validates :REL_OP, presence: true, uniqueness: true
end