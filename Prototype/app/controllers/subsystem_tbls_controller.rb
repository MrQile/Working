class SubsystemTblsController < ParentController
	before_action :admin_user, except: [:index]
	
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
			redirect_to @subs
		else
			render 'new'
		end
	end

	def update
		@subs = SUBSYSTEM_TBL.find(params[:id])
		if @subs.update_attributes(sub_params)
			redirect_to subsystem_tbls_url
		else
			render 'edit'
		end
	end

	def destroy
		SUBSYSTEM_TBL.find(params[:id]).destroy
		redirect_to subsystem_tbls_url
	end

	private

		def sub_params
			params.require(:subsystem_tbl).permit(:SUBSYSTEM_ID, :SUBSYSTEM_NAME)
		end
end
