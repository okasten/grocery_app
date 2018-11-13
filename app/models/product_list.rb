class ProductList < ApplicationRecord
	belongs_to :list
	belongs_to :product
	belongs_to :store
end
