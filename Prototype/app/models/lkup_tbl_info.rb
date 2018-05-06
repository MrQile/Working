class LKUP_TBL_INFO < ExternalDbAccess
	self.table_name = "LKUP_TBL_INFO"
	has_many :lkup_tbls, class_name: "LKUP_TBL", primary_key: "LKUP_TBL_NO", foreign_key: "LKUP_TBL_NO", dependent: :destroy
	has_paper_trail class_name: 'Version'

	validates :LKUP_TBL_NO, presence: true, numericality: { only_integer: true }
    validates :LKUP_TBL_NAME, presence: true, length: { maximum: 31 }
    validates :LKUP_TBL_TYPE, presence: true
end
