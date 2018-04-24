class ParentController < ApplicationController
	before_action :find_base_cmd, only: [:index, :show, :new, :edit]
	before_action :logged_in_user
end