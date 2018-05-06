class CmdPartTypesTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil

	def index
		@search = CMD_PART_TYPES_TBL.ransack(params[:q])
		@cmd_part_types = @search.result
		@search.build_condition
	end

	def new
		@cmd_part_types = CMD_PART_TYPES_TBL.new
	end

	def show
		@cmd_part_types = CMD_PART_TYPES_TBL.find(params[:id])
	end

	def edit
		@cmd_part_types = CMD_PART_TYPES_TBL.find(params[:id])
	end

	def create
		@cmd_part_types = CMD_PART_TYPES_TBL.new(cmd_part_type_params)
		if @cmd_part_types.save
			flash[:success] = "Successfully created cmd part type #{@cmd_part_types.CMD_PART_TYPE}"
			redirect_to @cmd_part_types
		else
			render 'new'
		end
	end

	def update
		@cmd_part_types = CMD_PART_TYPES_TBL.find(params[:id])
		if @cmd_part_types.update_attributes(cmd_part_type_params)
			flash[:success] = "Successfully updated cmd part type #{@cmd_part_types.CMD_PART_TYPE}"
			redirect_to cmd_part_types_tbls_url
		else
			render 'edit'
		end
	end

	def destroy
		@cmd_part_types = CMD_PART_TYPES_TBL.find(params[:id])
		@cmd_part_types.destroy
		flash[:warning] = "Successfully deleted cmd part type #{@cmd_part_types.CMD_PART_TYPE}"
		redirect_to cmd_part_types_tbls_url
	end

	private

		def cmd_part_type_params
			params.require(:cmd_part_types_tbl).permit(:CMD_PART_TYPE)
		end
end