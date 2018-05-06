class CmdTypesTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil

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
			flash[:success] = "Successfully created cmd type #{@cmd_types.CMD_TYPE}"
			redirect_to cmd_types_tbls_path
		else
			render 'new'
		end
	end

	def update
		begin
			@cmd_types = CMD_TYPES_TBL.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields."
			redirect_to cmd_types_tbls_path
			return
		end
		if @cmd_types.update_attributes(cmd_type_params)
			flash[:success] = "Successfully updated cmd type #{@cmd_types.CMD_TYPE}"
			redirect_to cmd_types_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@cmd_types = CMD_TYPES_TBL.find(params[:id])
		@cmd_types.destroy
		flash[:warning] = "Successfully deleted cmd type #{@cmd_types.CMD_TYPE}"
		redirect_to cmd_types_tbls_path
	end

	def check_unique
		if CMD_TYPES_TBL.find_by(CMD_TYPE: params[:key])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end

	private

		def cmd_type_params
			params.require(:cmd_types_tbl).permit(:CMD_TYPE_ID, :CMD_TYPE, :CMD_TYPES_TBL_CMD_TYPE)
		end
end
