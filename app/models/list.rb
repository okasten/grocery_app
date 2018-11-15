class List < ApplicationRecord
	belongs_to :user
	has_many :product_lists
	has_many :products, through: :product_lists

	def find_product_amount(product)
		ProductList.find_by(product_id: product.id, list_id: self.id).product_amount
	end

	def name_with_store
		byebug
		@product_list = ProductList.find_by(list_id: self.id)
		"#{self.name} - #{Store.find(@product_list.store_id).name}"
	end
end
