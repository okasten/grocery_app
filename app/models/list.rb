class List < ApplicationRecord
	belongs_to :user
	has_many :product_lists
	has_many :products, through: :product_lists

	def find_product_amount(product)
		ProductList.find_by(product_id: product.id, list_id: self.id).product_amount
	end

	def name_with_store
		@product_list = ProductList.find_by(list_id: self.id)
		"#{self.name} - #{Store.find(@product_list.store_id).name}"
	end

	def aisle_and_price(product)
		product.product_lists.each do |product_list|
			@store_product = StoreProduct.find_by(store_id: product_list.store_id, product_id: product.id)
			@aisle_and_price = "No aisle or price associated with this store yet."
			if @store_product
					@aisle_and_price = "Aisle: #{@store_product.aisle}" + "\nPrice: #{@store_product.price}" + "\nStore: #{@store_product.store.name}"
					return @aisle_and_price
			end
		end
		return @aisle_and_price
	end
end
