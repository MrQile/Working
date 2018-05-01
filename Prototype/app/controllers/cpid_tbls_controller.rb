class CpidTblsController < ParentController
	before_action :find_base_cmd, except: :destroy
	def index
		@cpids = @base_cmds.cpid_tbls
	end

	def new
		@cpids = CPID_TBL.new(CMD_ID: session[:cmd_id])
	end

	def edit
		@cpids = CPID_TBL.find(params[:id])
	end

	def create
		@cpids = CPID_TBL.new(cpid_params)
		if @cpids.save
			redirect_to cpid_tbls_path
		else
			render 'new'
		end
	end

	def update
		@cpids = CPID_TBL.find(params[:id])
		if @cpids.update_attributes(cpid_params)
			redirect_to cpid_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		CPID_TBL.find(params[:id]).destroy
		redirect_to cpid_tbls_path
	end

	private

		def cpid_params
			params.require(:cpid_tbl).permit(:CMD_ID, :CPID ,:CPID_DESC ,:TM_VAL, :TM_COUNT, :PROC_TYPE )
		end
end