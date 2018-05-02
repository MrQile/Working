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
			flash[:success] = "Successfully created cpid #{@cpids.CMD_ID}, #{@cpids.CPID}"
			redirect_to cpid_tbls_path
		else
			render 'new'
		end
	end

	def update
		begin
			@cpids = CPID_TBL.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Caution: Take extra care while changing key fields. Please start afresh"
			redirect_to cpid_tbls_path
			return
		end
		begin
			if  @cpids.update_attributes(cpid_params)
				flash[:success] = "Successfully updated cpid #{@cpids.CMD_ID}, #{@cpids.CPID}"
				redirect_to cpid_tbls_path
			else
				render 'edit'
			end
		rescue ActiveRecord::RecordNotUnique => e
			flash[:danger] = "Doesn't Form a unique record"
    		redirect_to edit_cpid_tbl_path
    		return
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