class BIT_SEL_TBL < ExternalDbAccess
	self.table_name = "BIT_SEL_TBL"
	self.primary_key = 'BIT_SEL_TBL_NO', 'FIELD_NO'
	has_paper_trail class_name: 'Version'
	belongs_to :bit_sel_tbl_info, class_name: "BIT_SEL_TBL_INFO", primary_key: "BIT_SEL_TBL_NO", foreign_key: "BIT_SEL_TBL_NO"

	HEXA_REGEX =  /\A^[0-9A-F]+$\z/
	validates :BIT_SEL_TBL_NO, presence: true, numericality: { only_integer: true }
    validates :FIELD_NO, presence: true, numericality: { only_integer: true }
    validates :START_BIT, presence: true, numericality: { only_integer: true }
    validates :NO_OF_BITS, presence: true, numericality: { only_integer: true }
    validates :BIT_MASK, presence: true, length: { maximum: 64 }, format: { with: HEXA_REGEX }
    validates :VALUE, presence: true, numericality: { only_integer: true }
    validates :FIELD_MNEMONICS, presence: true, length: { maximum: 31 }
    validates :VALUE_MNEMONICS, presence: true, length: { maximum: 64 }
    validates :LOGICAL_OP, presence: true

end
