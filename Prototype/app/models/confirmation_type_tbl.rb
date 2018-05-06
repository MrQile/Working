class CONFIRMATION_TYPE_TBL < AllConfigAccess
	self.table_name = "CONFIRMATION_TYPE_TBL"
	has_paper_trail class_name: 'Version'
	
    validates :CONFIRMATION_TYPE, presence: true, uniqueness: true
    validates :BIT_POSITION, presence: true, numericality: true, uniqueness: true
end
