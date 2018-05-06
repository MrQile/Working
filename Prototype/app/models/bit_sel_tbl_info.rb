class BIT_SEL_TBL_INFO < ExternalDbAccess
	self.table_name = "BIT_SEL_TBL_INFO"
	has_many :bit_sel_tbls, class_name: "BIT_SEL_TBL", primary_key: "BIT_SEL_TBL_NO", foreign_key: "BIT_SEL_TBL_NO", dependent: :destroy
	has_paper_trail class_name: 'Version'

	validates :BIT_SEL_TBL_NO, presence: true, numericality: { only_integer: true }
    validates :BIT_SEL_TBL_NAME, presence: true, length: { maximum: 31 }
end