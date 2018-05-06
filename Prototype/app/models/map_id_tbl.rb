class MAP_ID_TBL < AllConfigAccess
	self.table_name = "MAP_ID_TBL"
	has_paper_trail class_name: 'Version'
	validates :MAP_ID, presence: true, uniqueness: true
	validates :MAP_BIT, presence: true, numericality: true
end