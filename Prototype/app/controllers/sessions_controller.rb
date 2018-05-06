class SessionsController < ApplicationController
	before_action :is_logged_in?, except: :destroy
	before_action :set_base_cmd_session_to_nil
	layout "startup"
	def new
	end

	def create
		user = User.find_by(name: params[:session][:name])
		if user && user.authenticate(params[:session][:password])
			log_in user
			session[:satellite] = params[:session][:satellite]
			@sat = SATELLITE_TABLE.find_by(:SATNAME => session[:satellite])
			if @sat.EDIT_ENABLE?
				session[:mod_sat] = 1
			else
				session[:mod_sat] = 0
			end
			host = params[:session][:host]
			db_name = params[:session][:database_name]
			db_username = params[:session][:database_username]
			db_password = params[:session][:database_password]
			database_change(user, host, db_name, db_username, db_password)	
		else
			flash.now[:danger] = "Invalid username/password combination"
			render 'new'
		end
	end

	def destroy
		log_out
		flash[:success] = "Successfully logged out"
		redirect_to root_url
	end

	def get_db_details
		@sat = SATELLITE_TABLE.find_by(SATNAME: params[:satellite_name])
		@sat_db_name = @sat.DB_NAME
		@sat_db_username = @sat.DB_USERNAME
		@sat_db_password = @sat.DB_PASSWORD
		respond_to do |format|
			format.js
		end
	end

	private
	
	def is_logged_in?
		if	logged_in?
			redirect_to user_path(current_user)
		end
	end
end