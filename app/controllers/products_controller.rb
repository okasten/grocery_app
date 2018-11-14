class ProductsController < ApplicationController
	def show
		# byebug
		@user = User.find(params[:user_id])
		@product = Product.find(params[:id])
		@product_list = ProductList.new
		@store_product = StoreProduct.new
		@stores = Store.all
		@lists = @user.lists
	end
end
