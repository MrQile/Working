class EXPRESSION < ExternalDbAccess
	self.table_name = "EXPRESSION"
	has_many :prereq_conf_expr_tbls, class_name: "PREREQ_CONF_EXPR_TBL", foreign_key: "EXPR_ID", primary_key: "EXPR_ID", dependent: :destroy
	has_paper_trail class_name: 'Version'

	def concat_three_fields
		field = self.TM_PID + " "
		field += self.REL_OP + " "
		field += self.VALUE
		field
	end
end
