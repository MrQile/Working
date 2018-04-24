class AllConfigAccess < ApplicationRecord
	self.abstract_class = true
	establish_connection("development2".to_sym)
end