class FORM_LOGIC_PART_DATA_TBL < ExternalDbAccess
	self.table_name = "FORM_LOGIC_PART_DATA_TBL"
	has_paper_trail class_name: 'Version'
	self.primary_key = 'CMD_ID', 'PART_NO', 'LOGIC_LEVEL'
	belongs_to :base_cmd_tbl, class_name: "BASE_CMD_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID"
	belongs_to :part_type_tbl, class_name: "PART_TYPE_TBL", foreign_key: "PART_TYPE", primary_key: "PART_TYPE"
	belongs_to :form_logic_part_type_tbl, class_name: "FORM_LOGIC_PART_TYPE_TBL", foreign_key: "FORM_LOGIC_PART_TYPE", primary_key: "FORM_LOGIC_PART_TYPE"

	HEXA_REGEX =  /\A^[0-9A-F]+$\z/
	validates :CMD_ID, presence: true, length: { is: 8 }, uniqueness: { scope: [:PART_NO, :LOGIC_LEVEL], message: "Doesn't form a unique record"}
    validates :PART_NO, presence: true, numericality: { only_integer: true }
    validates :LOGIC_LEVEL, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 3 }
    validates :LOGIC_PART_NO, presence: true, numericality: { only_integer: true }
    validates :FORM_LOGIC_PART_TYPE, presence: true
    validates :PART_MNEMONIC, presence: true, length: { maximum: 48 }
    validates :SUB_LOGIC_TYPE, presence: true
    validates :PART_TYPE, presence: true, length: { maximum: 32 }
    validates :START_BIT, presence: true, numericality: { only_integer: true }
    validates :NO_OF_BITS, presence: true, numericality: { only_integer: true }
    validates :PART_MASK, presence: true, length: { maximum: 255 }, format: { with: HEXA_REGEX }
    validates :RESOLUTION, presence: true
    validates :OFFSET, presence: true, numericality: { message: "Must be a floating point number" }
    validates :INPUT_FORMAT, presence: true
    validates :LL, presence: true, numericality: true
    validates :UL, presence: true, numericality: true
    validates :UNITS, presence: true, length: { maximum: 16 }
    validates :REMARKS, presence: true, length: { maximum: 40 }
end