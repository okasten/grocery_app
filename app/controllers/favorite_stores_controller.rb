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
		# byebug
		
		if params[:favorite_store][:store_id]
			@store = Store.find(params[:favorite_store][:store_id])
		else
			@store = Store.new(store_params)
			unless @store.save
				render :new
			end
		end

		@favorite_store = FavoriteStore.new(store_id: @store.id, user_id: params[:user_id])
		if @favorite_store.save
			redirect_to user_favorite_stores_path
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
	def store_params
		params.require(:store).permit(:name, :address)
	end
end