class FORM_LOGIC_PART_TYPE_TBL < AllConfigAccess
	self.table_name = "FORM_LOGIC_PART_TYPE_TBL"
	has_paper_trail class_name: 'Version'
    validates :FORM_LOGIC_PART_TYPE, presence: true, uniqueness: true
end