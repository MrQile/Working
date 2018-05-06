class SATELLITE_TABLE < AllConfigAccess
	self.table_name = "SATELLITE_TABLE"
	has_paper_trail class_name: 'Version'
	validates :SATNAME, presence: true, uniqueness: true
    validates :SCSHORTNAME, presence: true
    validates :EDIT_ENABLE, presence: true, numericality: { only_integer: true }
    validates :CCSDS_FLAG, presence: true
    validates :DB_NAME, presence: true
    validates :DB_USERNAME, presence: true
    validates :DB_PASSWORD, presence: true
end