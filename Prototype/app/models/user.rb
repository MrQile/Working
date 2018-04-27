class User < AllConfigAccess
	has_secure_password
	has_many :versions, foreign_key: "whodunnit", primary_key: "id"
	validates :name, presence: true, length: { minimum: 3 },
											   uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }
	validates :satellite_name, presence: true, length: { minimum: 3 }

end