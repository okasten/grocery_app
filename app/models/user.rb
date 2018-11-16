class User < ApplicationRecord
	has_many :favorite_stores
	has_many :stores, through: :favorite_stores
	has_many :lists

	validates :email, { presence: true, uniqueness: true }
	validates :username, { presence: true, uniqueness: true }
	validates :name, presence: true
	validates :password, presence: true
	has_secure_password
end
