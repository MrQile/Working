class RelOpTblsController < ParentController
	before_action :admin_user, only: [:destroy]
	before_action :set_base_cmd_session_to_nil

	def index
		@rel_op = REL_OP_TBL.all
	end

	def new
		@rel_op = REL_OP_TBL.new
	end

	def edit
		@rel_op = REL_OP_TBL.find(params[:id])
	end

	def create
		@rel_op = REL_OP_TBL.new(rel_op_params)
		if @rel_op.save
			redirect_to rel_op_tbls_path
		else
			render 'new'
		end
	end

	def update
		@rel_op = REL_OP_TBL.find(params[:id])
		if @rel_op.update_attributes(rel_op_params)
			redirect_to rel_op_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		REL_OP_TBL.find(params[:id]).destroy
		redirect_to rel_op_tbls_path
	end

	private
		def rel_op_params
			params.require(:rel_op_tbl).permit(:REL_OP)
		end
end