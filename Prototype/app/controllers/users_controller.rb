class UsersController < ApplicationController
	before_action :logged_in_user, except: [:new, :create]
	before_action :admin_user, only: :destroy
	before_action :set_base_cmd_session_to_nil
	layout "startup"

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
		correct_user @user
	end

	def show
		@user = User.find(params[:id])
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Please log in to continue"
			redirect_to login_path
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(current_user)
		elsif @user.update_attributes(user_params)
			flash[:success] = "Successfully updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:destroy] = "Successfully deleted"
		redirect_to users_path
	end

	private

		def user_params
			params.require(:user).permit( :name, :password, :password_confirmation, :satellite_name)
		end

end
