require 'nokogiri'
require 'open-uri'
require 'json'

class StoresController < ApplicationController
	before_action :find_store, only: [:show, :edit, :update, :destroy]
	before_action :find_user, only: [:show, :products_search]

	def index
		@stores = Store.all
	end

	def new
		@store = Store.new
	end

	def create
		@store = Store.new(store_params)
		if @store.save
			redirect_to @store
		else
			render :new
		end 
	end

	def show
		@store_products = @store.store_products
	end

	def products_search
		@product_name = params[:product]
		@products = Product.where("name LIKE ?", "%#{@product_name}%")
	end

	def edit
	end

	def update
		if @store.update(store_params)
			redirect_to @store
		else
			render :new
		end
	end

	def destroy
		@store.destroy
		redirect_to stores_path
	end

	private
		def store_params
			params.require(:store).permit(:name, :address)
		end

		def find_store
			@store = Store.find(params[:id])
		end

		def find_user
			@user = User.find(params[:user_id])
		end
end
