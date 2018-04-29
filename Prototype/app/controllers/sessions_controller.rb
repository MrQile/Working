class SessionsController < ApplicationController
	before_action :is_logged_in?, except: :destroy
	before_action :set_base_cmd_session_to_nil
	layout "startup"
	def new
		@minor = MinorConfig.all
	end

	def create
		user = User.find_by(name: params[:session][:name])
		if user && user.authenticate(params[:session][:password])
			log_in user
			host = params[:session][:host]
			defaults = params[:session][:default_db_env]
			db_name = params[:session][:database_name]
			db_username = params[:session][:database_username]
			db_password = params[:session][:database_password]
			database_change(user, defaults, host, db_name, db_username, db_password)	
		else
			flash.now[:danger] = "Invalid username/password combination"
			render 'edit'
		end
	end

	def destroy
		log_out
		flash[:success] = "Successfully logged out"
		redirect_to root_url
	end

	private

	def is_logged_in?
		if	logged_in?
			redirect_to user_path(current_user)
		end
	end
end