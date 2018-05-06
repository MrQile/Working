class RelOpTblsController < ParentController
	before_action :admin_user, except: :index
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
			flash[:success] = "Successfully created rel op #{@rel_op.REL_OP}"
			redirect_to rel_op_tbls_path
		else
			render 'new'
		end
	end

	def update
		@rel_op = REL_OP_TBL.find(params[:id])
		if @rel_op.update_attributes(rel_op_params)
			flash[:success] = "Successfully updated rel op #{@rel_op.REL_OP}"
			redirect_to rel_op_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@rel_op = REL_OP_TBL.find(params[:id])
		@rel_op.destroy
		flash[:warning] = "Successfully deleted rel op #{@rel_op.REL_OP}"
		redirect_to rel_op_tbls_path
	end

	private
		def rel_op_params
			params.require(:rel_op_tbl).permit(:REL_OP)
		end
end