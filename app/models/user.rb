class User < ApplicationRecord
	has_many :favorite_stores
	has_many :stores, through: :favorite_stores
	has_many :lists

	validates :email, uniqueness: true
	validates :username, uniqueness: true
end
