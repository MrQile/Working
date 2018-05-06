class BASE_FORMATION_LOGIC_TBL < AllConfigAccess
	self.table_name = "BASE_FORMATION_LOGIC_TBL"
	has_paper_trail class_name: 'Version'

	validates :BASE_FORMATION_LOGIC, presence: true, length: { maximum: 32 }, uniqueness: true
end
