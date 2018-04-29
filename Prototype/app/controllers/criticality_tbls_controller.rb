class CriticalityTblsController < ParentController
	before_action :admin_user, only: [:destroy]
	before_action :set_base_cmd_session_to_nil


	def index
		@crity = CRITICALITY_TBL.all
	end

	def new
		@crity = CRITICALITY_TBL.new
	end

	def edit
		@crity = CRITICALITY_TBL.find(params[:id])
	end

	def create
		@crity = CRITICALITY_TBL.new(criticality_params)
		if @crity.save
			redirect_to criticality_tbls_path
		else
			render 'new'
		end
	end

	def update
		@crity = CRITICALITY_TBL.find(params[:id])
		if @crity.update_attributes(criticality_params)
			redirect_to criticality_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		CRITICALITY_TBL.find(params[:id]).destroy
		redirect_to criticality_tbls_path
	end

	private
		def criticality_params
			params.require(:criticality_tbl).permit(:CRITICALITY)
		end
end
