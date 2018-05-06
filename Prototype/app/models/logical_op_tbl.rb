class LOGICAL_OP_TBL < AllConfigAccess
	self.table_name = "LOGICAL_OP_TBL"
	has_paper_trail class_name: 'Version'
	validates :LOGICAL_OP, presence: true, uniqueness: true
end