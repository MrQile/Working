class Version < AllConfigAccess
	include PaperTrail::VersionConcern
	belongs_to :user, foreign_key: "whodunnit", primary_key: "id"
	before_save :update_working_details

	def update_working_details
		config = ExternalDbAccess.connection_config
		self.db_name = config[:database]
	end
end