class Store < ApplicationRecord
	has_many :favorite_stores
	has_many :users, through: :favorite_stores
	has_many :store_products
	has_many :products, through: :store_products
end
