class CpidTblsController < ParentController
	before_action :find_base_cmd, except: :destroy
	def index
		if params[:val] == "1"
			session[:cmd_id] = 0
			@cpids = CPID_TBL.all
		else
			@cpids = @base_cmds.cpid_tbls
		end
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
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields"
			redirect_to cpid_tbls_path
			return
		end
		if  @cpids.update_attributes(cpid_params)
			flash[:success] = "Successfully updated cpid #{@cpids.CMD_ID}, #{@cpids.CPID}"
			redirect_to cpid_tbls_path
		else
			render 'edit'
		end
	end
		

	def destroy
		@cpids = CPID_TBL.find(params[:id])
		@cpids.destroy
		flash[:warning] = "Successfully deleted cpid #{@cpids.CMD_ID}, #{@cpids.CPID}"
		redirect_to cpid_tbls_path
	end

	def check_unique
		if CPID_TBL.find_by(CMD_ID: params[:key1],CPID: params[:key2])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end

	private

		def cpid_params
			params.require(:cpid_tbl).permit(:CMD_ID, :CPID ,:CPID_DESC ,:TM_VAL, :TM_COUNT, :PROC_TYPE )
		end
end