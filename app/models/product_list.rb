class ProductList < ApplicationRecord
	belongs_to :list
	belongs_to :product
	belongs_to :store

	validates :product_id, uniqueness: true
	validates :product_amount, { presence: true, inclusion: 1..99 }


end
