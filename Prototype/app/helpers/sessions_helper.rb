module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id             #:user_id is a build in tool for login purposes, to access user id in subsequent pages( stored as a cookies )
	end

	def current_user
  		@current_user ||= User.find_by(id: session[:user_id])  #use of instance variable( which exists in the scope where it is defined ) to store the value
	end

	# def save_cmd(base)
	# 	session[:cmd_id] = base.CMD_ID
	# end
	# ExternalDbAccess.establish_connection("#{database}".to_sym)


	# conn_config = ActiveRecord::Base.connection_config  /* Brings out the first entry in database.yml , check in rails console */
	# conn_config[:database] = database_name
	# ExternalDbAccess.establish_connection conn_config
	def database_change(defaults, server, db_name, db_username, db_password)
		config = ActiveRecord::Base.configurations["#{defaults}"]
		config["host"] = server
		config["database"] = db_name
		config["username"] = db_username
		config["password"] = db_password
		ExternalDbAccess.establish_connection config
	end
	# ExternalDbAccess.establish_connection({"#{database}"=>{"host"=>"#{server}"}})
	def save_bit(bit)
		session[:bit_id] = bit.BIT_SEL_TBL_NO
	end

	def save_lkup(lkup)
		session[:lkup_id] = lkup.LKUP_TBL_NO
	end

 		 # Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end

	def log_out
		# session.delete(:cmd_id)
		# session.delete(:user_id)
		session.clear 		#To clear all session
		@current_user = nil
	end

	def correct_user(user)
		if user!=current_user
			redirect_to user_path(current_user)
		end
	end

	def not_found
  		raise ActionController::RoutingError.new('Not Found') # to route to a 404 not found error page , aka faking it.
	end
end
