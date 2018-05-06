class ParentController < ApplicationController
	before_action :logged_in_user
	before_action :satellite_editable, except: :index
	before_action :user_modifiability, except: :index
end