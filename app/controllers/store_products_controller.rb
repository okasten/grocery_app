class StoreProductsController < ApplicationController

	def index

	end

	def new

	end

	def create
		@product = Product.find(params[:store_product][:product_id])
		@store_product = StoreProduct.new(store_product_params)
		@user = User.find(params[:user_id])
		if @store_product.save
			redirect_to user_product_path(@user, @product)
		else
			redirect_to user_product_path(@user, @product)
		end
	end

	private
	def store_product_params
		params.require(:store_product).permit(:aisle, :price, :product_id, :store_id)
	end

end
