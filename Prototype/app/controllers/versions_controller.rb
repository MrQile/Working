class VersionsController < ApplicationController
	before_action :logged_in_user
	before_action :admin_user, only: :destroy

	def index
		session[:cmd_id] = 0
		if current_user.admin?
			@versions =  Version.all.includes(:user).paginate(:page => params[:page], :per_page => 10 )
		else
			@versions = Version.where(:whodunnit => current_user).includes(:user).paginate(:page => params[:page], :per_page => 10 )
		end
	end

	def destroy
		Version.find(params[:id]).destroy
		redirect_to versions_path
	end

end
