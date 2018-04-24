class SessionsController < ApplicationController
	layout "startup"
	def new
		@minor = MinorConfig.all
	end

	def create
		user = User.find_by(name: params[:session][:name])
		if user && user.authenticate(params[:session][:password])
			log_in user
			server = params[:session][:server_name]
			defaults = params[:session][:defaults]
			db_name = params[:session][:database_name]
			db_username = params[:session][:database_username]
			db_password = params[:session][:database_password]
			database_change(defaults, server, db_name, db_username, db_password)
			redirect_to user
		else
			render 'new'
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end
end