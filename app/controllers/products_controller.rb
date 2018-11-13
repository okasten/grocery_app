class ProductsController < ApplicationController
	def show
		@product = Product.find(params[:id])
		@store_product = StoreProduct.new
		@stores = Store.all
	end
end
