class SubsystemTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil
	
	def index
		session[:cmd_id] = 0
		@search = SUBSYSTEM_TBL.ransack(params[:q])
		@subs = @search.result
		@search.build_condition
	end

	def new
		@subs = SUBSYSTEM_TBL.new
	end

	def show
		@subs = SUBSYSTEM_TBL.find(params[:id])
	end

	def edit
		@subs = SUBSYSTEM_TBL.find(params[:id])
	end

	def create
		@subs = SUBSYSTEM_TBL.new(sub_params)
		if @subs.save
			flash[:success] = "Successfully created subsystem #{@subs.SUBSYSTEM_NAME}"
			redirect_to subsystem_tbls_path
		else
			render 'new'
		end
	end

	def update
		begin
			@subs = SUBSYSTEM_TBL.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields."
			redirect_to subsystem_tbls_path
			return
		end
		if @subs.update_attributes(sub_params)
			flash[:success] = "Successfully updated subsystem #{@subs.SUBSYSTEM_NAME}"
			redirect_to subsystem_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@subs = SUBSYSTEM_TBL.find(params[:id])
		@subs.destroy
		flash[:warning] = "Successfully deleted  subsystem #{@subs.SUBSYSTEM_NAME}"
		redirect_to subsystem_tbls_path
	end

	def check_unique
		if SUBSYSTEM_TBL.find_by(SUBSYSTEM_NAME: params[:key])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end

	private

		def sub_params
			params.require(:subsystem_tbl).permit(:SUBSYSTEM_ID, :SUBSYSTEM_NAME, :SUBSYSTEM_SHORT_NAME)
		end
end
