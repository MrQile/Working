class CMD_PART_TBL < ExternalDbAccess
	self.table_name = "CMD_PART_TBL"
	self.primary_key = 'CMD_ID', 'CMD_PART_NO'
    has_paper_trail class_name: 'Version'
	belongs_to :base_cmd_tbl, class_name: "BASE_CMD_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID"

	HEXA_REGEX =  /\A^[0-9A-F]+$\z/
	validates :CMD_ID, presence: true, length: { is: 8 }
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
