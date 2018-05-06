class EXPR_TYPE_TBL < AllConfigAccess
	self.table_name = "EXPR_TYPE_TBL"
	has_paper_trail class_name: 'Version'
    validates :EXPR_TYPE, presence: true, uniqueness: true
end