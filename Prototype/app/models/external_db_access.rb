class ExternalDbAccess < ApplicationRecord
	self.abstract_class = true
	has_paper_trail class_name: 'Version'
end
