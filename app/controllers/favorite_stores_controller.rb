class FavoriteStoresController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@favorite_store = FavoriteStore.new
		@stores = Store.all
	end

	def new
		@user = User.find(params[:user_id])
		@favorite_store = FavoriteStore.new
		@store = Store.new
	end

	def create
		byebug
		@store = Store.new(store_params)
		@favorite_store = FavoriteStore.new(fav_store_params)
		if @store.save && @favorite_store.save
			redirect_to user_favorite_stores_path()
		else
			render :new
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@favorite_store = FavoriteStore.find_by(user_id: params[:user_id], store_id: params[:id])
		@favorite_store.destroy
		redirect_to user_favorite_stores_path
	end

	private
	def fav_store_params
		params.require(:favorite_store).permit(user_id: params[:user_id], store_id: params[:id], comment: params[:comment])
	end
end
