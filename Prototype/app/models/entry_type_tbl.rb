class ENTRY_TYPE_TBL < AllConfigAccess
	self.table_name = "ENTRY_TYPE_TBL"
	has_paper_trail class_name: 'Version'
	
    validates :ENTRY_TYPE, presence: true, uniqueness: true
end