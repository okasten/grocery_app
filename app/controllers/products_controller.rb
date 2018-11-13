class ProductsController < ApplicationController
	def show
		@product = Product.find(params[:id])
		@product_list = ProductList.new
		@store_product = StoreProduct.new
		@stores = Store.all
		@lists = List.all
	end
end
