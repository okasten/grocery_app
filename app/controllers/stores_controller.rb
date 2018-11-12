class StoresController < ApplicationController
	before_action :find_store, only: [:show, :edit, :update, :destroy]

	def index
		@stores = Store.all
	end

	def new
		@store = Store.new
	end

	def create
	end

	def show
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
end