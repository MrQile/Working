class CRITICALITY_TBL < AllConfigAccess
	self.table_name = "CRITICALITY_TBL"
	has_paper_trail class_name: 'Version'

    validates :CRITICALITY, presence: true, uniqueness: true

end