class SessionsController < ApplicationController
	def new
		# byebug
	end

	def create
		@user = User.find_by(username: params[:username].downcase)
		# byebug
		if @user && @user.authenticate(params[:password])
			log_in_user(@user)
			redirect_to user_path(@user)
		else
			flash[:errors] = ["wrong password or username"]
			redirect_to new_session_path
		end
	end

	def destroy
	end
end