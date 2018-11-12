class Store < ApplicationRecord
	has_many :favorite_stores
	has_many :users, through: :favorite_stores
	has_many :store_products
	has_many :products, through: :store_products

	validates :name, presence: true
	validates :address, { presence: true, uniqueness: { scope: :name } }
end
