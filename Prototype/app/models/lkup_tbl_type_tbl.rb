class LKUP_TBL_TYPE_TBL < AllConfigAccess
	self.table_name = "LKUP_TBL_TYPE_TBL"
	has_paper_trail class_name: 'Version'
	validates :LKUP_TBL_TYPE, presence: true, uniqueness: true
end