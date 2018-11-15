class User < ApplicationRecord
	has_many :favorite_stores
	has_many :stores, through: :favorite_stores
	has_many :lists

	validates :email, { presence: true, uniqueness: true }
	validates :username, { presence: true, uniqueness: true }
	validates :name, presence: true
	validates :password_digest, presence: true

	def authenticate(plaintext_password)
		BCrypt::Password.new(self.password_digest) == plaintext_password
	end

	def password=(plaintext_password)
		self.password_digest = BCrypt::Password.create(plaintext_password)
	end
end
