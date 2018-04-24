class CmdPartTblsController < ParentController
	def index
		@cmd_parts = CMD_PART_TBL.where(CMD_ID: session[:cmd_id])
	end

	def new
		@cmd_parts = CMD_PART_TBL.new(CMD_ID: session[:cmd_id])
	end

	def show
		@cmd_parts = CMD_PART_TBL.find(params[:id])
	end

	def edit
		@cmd_parts = CMD_PART_TBL.find(params[:id])
	end

	def create
		@cmd_parts = CMD_PART_TBL.new(cmd_part_params)
		if @cmd_parts.save
			redirect_to @cmd_parts
		else
			render 'new'
		end
	end

	def update
		@cmd_parts = CMD_PART_TBL.find(params[:id])
		if @cmd_parts.update_attributes(cmd_part_params)
			redirect_to cmd_part_tbls_url
		else
			render 'edit'
		end
	end

	def destroy
		CMD_PART_TBL.find(params[:id]).destroy
		redirect_to cmd_part_tbls_url
	end

	private

		def cmd_part_params
			params.require(:cmd_part_tbl).permit(:CMD_ID, :CMD_PART_NO ,:CMD_PART_MNEMONIC ,:CMD_PART_TYPE, :START_BIT, :NO_OF_BITS ,:PART_MASK ,:RESOLUTION ,:OFFSET ,:INPUT_FORMAT ,:LL ,:UL ,:UNITS ,:REMARKS)
		end
end