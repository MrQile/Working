class CMD_PART_TBL < ExternalDbAccess
	has_paper_trail class_name: 'Version'
	self.table_name = "CMD_PART_TBL"
	self.primary_key = 'CMD_ID', 'CMD_PART_NO'
    has_paper_trail class_name: 'Version'
	belongs_to :base_cmd_tbl, class_name: "BASE_CMD_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID"
	belongs_to :cmd_part_types_tbl, class_name: "CMD_PART_TYPES_TBL", foreign_key: "CMD_PART_TYPE", primary_key: "CMD_PART_TYPE"
	# belongs_to :bit_sel_tbl_info, class_name: "BIT_SEL_TBL_INFO", foreign_key: "RESOLUTION", primary_key: "BIT_SEL_TBL_NO"
	# belongs_to :lkup_tbl_info, class_name: "LKUP_TBL_INFO", foreign_key: "RESOLUTION", primary_key: "LKUP_TBL_NO"

	HEXA_REGEX =  /\A^[0-9A-F]+$\z/
	validates :CMD_ID, presence: true, length: { is: 8 }, uniqueness: { scope: [:CMD_PART_NO] }
    validates :CMD_PART_NO, presence: true, numericality: { only_integer: true }
    validates :CMD_PART_MNEMONIC, presence: true, length: { maximum: 48 }
    validates :CMD_PART_TYPE, presence: true, length: { maximum: 32 }
    validates :START_BIT, presence: true, numericality: { only_integer: true }
    validates :NO_OF_BITS, presence: true, numericality: { only_integer: true }
    validates :PART_MASK, presence: true, length: { maximum: 255 }, format: { with: HEXA_REGEX }
    validates :RESOLUTION, presence: true
    validates :OFFSET, presence: true, numericality: true
    validates :INPUT_FORMAT, presence: true
    validates :LL, presence: true, numericality: true
    validates :UL, presence: true, numericality: true
    validates :UNITS, presence: true, length: { maximum: 16 }
    validates :REMARKS, presence: true, length: { maximum: 40 }
end
