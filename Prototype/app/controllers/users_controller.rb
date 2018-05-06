class UsersController < ApplicationController
	before_action :logged_in_user
	before_action :admin_user, except: [:index, :show]
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
	end

	def show
		@user = User.find(params[:id])
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Successfully created user #{@user.name}"
			redirect_to @user
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Successfully updated user #{@user.name}"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:warning] = "Successfully deleted user #{@user.name}"
		redirect_to users_path
	end

	private

		def user_params
			params.require(:user).permit( :name, :password, :password_confirmation, :modifiability)
		end

end
