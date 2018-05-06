class CmdPartTblsController < ParentController
	before_action :find_base_cmd, except: :destroy
	def index
		if params[:val] == "1"
			session[:cmd_id] = 0
			@cmd_parts = CMD_PART_TBL.all
		else
			@cmd_parts = @base_cmds.cmd_part_tbls
		end
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
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields"
			redirect_to cmd_part_tbls_path
			return
		end
		if  @cmd_parts.update_attributes(cmd_part_params)
			flash[:success] = "Successfully updated cmd part #{@cmd_parts.CMD_ID}, #{@cmd_parts.CMD_PART_NO}"
			redirect_to cmd_part_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@cmd_parts = CMD_PART_TBL.find(params[:id])
		@cmd_parts.destroy
		flash[:warning] = "Successfully deleted cmd part #{@cmd_parts.CMD_ID}, #{@cmd_parts.CMD_PART_NO}"
		redirect_to cmd_part_tbls_path
	end

	def check_unique
		if CMD_PART_TBL.find_by(CMD_ID: params[:key1],CMD_PART_NO: params[:key2])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end

	private

		def cmd_part_params
			params.require(:cmd_part_tbl).permit(:CMD_ID, :CMD_PART_NO ,:CMD_PART_MNEMONIC ,:CMD_PART_TYPE, :START_BIT, :NO_OF_BITS ,:PART_MASK ,:RESOLUTION ,:OFFSET ,:INPUT_FORMAT ,:LL ,:UL ,:UNITS ,:REMARKS)
		end
end