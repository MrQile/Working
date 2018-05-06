class PREFERRABLE_DECODER_TBL < AllConfigAccess
	self.table_name = "PREFERRABLE_DECODER_TBL"
	has_paper_trail class_name: 'Version'
	validates :PREFERRABLE_DECODER, presence: true, uniqueness: true
end