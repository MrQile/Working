class CmdTypesTblsController < ParentController
	before_action :admin_user, except: [:index]
	
	def index
		@search = CMD_TYPES_TBL.ransack(params[:q])
		@cmd_types = @search.result
		@search.build_condition
	end

	def new
		@cmd_types = CMD_TYPES_TBL.new
	end

	def show
		@cmd_types = CMD_TYPES_TBL.find(params[:id])
	end

	def edit
		@cmd_types = CMD_TYPES_TBL.find(params[:id])
	end

	def create
		@cmd_types = CMD_TYPES_TBL.new(cmd_type_params)
		if @cmd_types.save
			redirect_to cmd_types_tbls_path
		else
			render 'new'
		end
	end

	def update
		@cmd_types = CMD_TYPES_TBL.find(params[:id])
		if @cmd_types.update_attributes(cmd_type_params)
			redirect_to cmd_types_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		CMD_TYPES_TBL.find(params[:id]).destroy
		redirect_to cmd_types_tbls_path
	end

	private

		def cmd_type_params
			params.require(:cmd_types_tbl).permit(:CMD_TYPE_ID, :CMD_TYPE, :CMD_TYPES_TBL_CMD_TYPE)
		end
end
