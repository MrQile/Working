class FORMATION_LOGIC_TBL < AllConfigAccess
	self.table_name = "FORMATION_LOGIC_TBL"
	has_paper_trail class_name: 'Version'
	validates :FORMATION_LOGIC, presence: true, uniqueness: true
    validates :FORMATION_LOGIC_LEVEL, presence: true, numericality: true
end