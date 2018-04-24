class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_paper_trail_whodunnit

  include SessionsHelper
  
  private

	def find_base_cmd

		if session[:cmd_id].present? && session[:cmd_id]!=0

			@base_cmds ||= BASE_CMD_TBL.find(session[:cmd_id])

		end
	end

	def logged_in_user
    
    unless logged_in?
    	redirect_to root_url
    end
  end

  def admin_user

    if !current_user.admin?
    	redirect_back(fallback_location: root_path)
	  end
  end

  # def user_for_paper_trail        #for overriding the whoduunit value stored in the versions model
  #   if logged_in?
  #     current_user.name
  #   end
  # end

end
