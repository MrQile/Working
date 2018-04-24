class User < AllConfigAccess
	has_secure_password
	has_many :versions, foreign_key: "whodunnit", primary_key: "id"
end