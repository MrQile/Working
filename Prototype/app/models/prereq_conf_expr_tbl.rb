class PREREQ_CONF_EXPR_TBL < ExternalDbAccess
	has_paper_trail class_name: 'Version'
	self.table_name = "PREREQ_CONF_EXPR_TBL"
	self.primary_keys = 'CMD_ID', 'ENTRY_TYPE', 'FIELD_NO'
	belongs_to :base_cmd_tbl, class_name: "BASE_CMD_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID"
	belongs_to :expression, class_name: "EXPRESSION", foreign_key: "EXPR_ID", primary_key: "EXPR_ID"
	

	validates :CMD_ID, presence: true, length: { is: 8 }, uniqueness: { scope: [:ENTRY_TYPE, :FIELD_NO], message: "Doesn't form a unique record" }
    validates :ENTRY_TYPE, presence: true, numericality: { only_integer: true }
    validates :FIELD_NO, presence: true, numericality: { only_integer: true }
    validates :EXPR_ID, presence: true, numericality: { only_integer: true }
    validates :LOGICAL_OP, presence: true
end