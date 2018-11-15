class ApplicationController < ActionController::Base
	before_action :check_login

	private
		def check_login
			@logged_in = logged_in?

			if logged_in?
				@user = User.find(logged_in_user_id)
			end
		end


		def log_in_user(user)
			session[:user_id] = user.id
		end

		def log_out
			session[:user_id] = nil
		end

		def logged_in_user_id
			session[:user_id]
		end

		def logged_in?
			!!logged_in_user_id
		end

		def authorized?(user_id)
			logged_in_user_id == user_id
		end
end
