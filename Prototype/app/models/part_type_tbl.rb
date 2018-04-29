class PART_TYPE_TBL < ExternalDbAccess
	self.table_name = "PART_TYPE_TBL"
	has_paper_trail class_name: 'Version'
	has_many :form_logic_part_data_tbl, class_name: "FORM_LOGIC_PART_DATA_TBL", foreign_key: "PART_TYPE", primary_key: "PART_TYPE", dependent: :destroy
end
