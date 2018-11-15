class Store < ApplicationRecord
	has_many :favorite_stores
	has_many :users, through: :favorite_stores
	has_many :store_products
	has_many :products, through: :store_products

	validates :name, presence: true
	validates :address, { presence: true, uniqueness: { scope: :name } }

	def find_store_product(product)
		StoreProduct.find_by(product_id: product.id, store_id: self.id)
	end

	def price(product)
		find_store_product(product).price
	end

	def aisle(product)
		find_store_product(product).aisle
	end
end
