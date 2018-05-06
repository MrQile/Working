class PULSE_WIDTH_TBL < AllConfigAccess
	self.table_name = "PULSE_WIDTH_TBL"
	has_paper_trail class_name: 'Version'
	validates :PULSE_WIDTH, presence: true, uniqueness: true
end