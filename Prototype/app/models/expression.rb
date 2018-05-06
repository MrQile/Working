class EXPRESSION < ExternalDbAccess
	self.table_name = "EXPRESSION"
	self.primary_key = 'EXPR_ID', 'EXPR_TYPE'
	has_many :prereq_conf_expr_tbls, class_name: "PREREQ_CONF_EXPR_TBL", foreign_key: "EXPR_ID", primary_key: "EXPR_ID", dependent: :destroy
	has_paper_trail class_name: 'Version'

	def concat_three_fields
		field = self.TM_PID + " "
		field += self.REL_OP + " "
		field += self.VALUE
		field
	end

	validates :EXPR_ID, presence: true, numericality: { only_integer: true }
    validates :EXPR_TYPE, presence: true, numericality: { only_integer: true }
    validates :TM_PID, presence: true, length: { maximum: 8 }
    validates :REL_OP, presence: true
    validates :VALUE, presence: true, length: { maximum: 255 }
    validates :VALUE_TYPE, presence: true
end
