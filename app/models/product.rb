class Product < ApplicationRecord
	has_many :store_products
	has_many :stores, through: :store_products
	has_many :product_lists
	has_many :lists, through: :product_lists
end
