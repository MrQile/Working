class CmdPartTblsController < ParentController
	before_action :find_base_cmd, except: :destroy
	def index
		@cmd_parts = @base_cmds.cmd_part_tbls
	end

	def new
		@cmd_parts = CMD_PART_TBL.new(CMD_ID: session[:cmd_id])
	end

	def edit
		@cmd_parts = CMD_PART_TBL.find(params[:id])
	end

	def create
		@cmd_parts = CMD_PART_TBL.new(cmd_part_params)
		if @cmd_parts.save
			flash[:success] = "Successfully created cmd part #{@cmd_parts.CMD_ID}, #{@cmd_parts.CMD_PART_NO}"
			redirect_to cmd_part_tbls_path
		else
			render 'new'
		end
	end

	def update
		begin
			@cmd_parts = CMD_PART_TBL.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Caution: Take extra care while changing key fields. Please start afresh"
			redirect_to cmd_part_tbls_path
			return
		end
		begin
			if  @cmd_parts.update_attributes(cmd_part_params)
				flash[:success] = "Successfully updated cmd part #{@cmd_parts.CMD_ID}, #{@cmd_parts.CMD_PART_NO}"
				redirect_to cmd_part_tbls_path
			else
				render 'edit'
			end
		rescue ActiveRecord::RecordNotUnique => e
			flash[:danger] = "Doesn't Form a unique record"
    		redirect_to edit_cmd_part_tbl_path
    		return
 		end
	end

		

	def destroy
		CMD_PART_TBL.find(params[:id]).destroy
		redirect_to cmd_part_tbls_path
	end

	private

		def cmd_part_params
			params.require(:cmd_part_tbl).permit(:CMD_ID, :CMD_PART_NO ,:CMD_PART_MNEMONIC ,:CMD_PART_TYPE, :START_BIT, :NO_OF_BITS ,:PART_MASK ,:RESOLUTION ,:OFFSET ,:INPUT_FORMAT ,:LL ,:UL ,:UNITS ,:REMARKS)
		end
end