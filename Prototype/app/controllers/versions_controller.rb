class VersionsController < ApplicationController
	before_action :logged_in_user
	before_action :admin_user

	def index
		session[:cmd_id] = 0
		@versions =  Version.all.includes(:user).paginate(:page => params[:page], :per_page => 10 )
	end

	def destroy
		Version.find(params[:id]).destroy
		redirect_to versions_path
	end

end
