class ProductList < ApplicationRecord
	belongs_to :list
	belongs_to :product
	belongs_to :store

	def name_with_store
		"#{name} - #{Store.find(store_id).name}"
	end
end
