class List < ApplicationRecord
	belongs_to :user
	has_many :product_list
	has_many :products, through: :product_list

	def find_product_amount(product)
		ProductList.find_by(product_id: product.id, list_id: self.id).product_amount
	end
end
