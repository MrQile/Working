class LogicalOpTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil

	def index
		@logic_op = LOGICAL_OP_TBL.all
	end

	def new
		@logic_op = LOGICAL_OP_TBL.new
	end

	def edit
		@logic_op = LOGICAL_OP_TBL.find(params[:id])
	end

	def create
		@logic_op = LOGICAL_OP_TBL.new(logical_op_params)
		if @logic_op.save
			flash[:success] = "Successfully created logical op #{@logic_op.LOGICAL_OP}"
			redirect_to logical_op_tbls_path
		else
			render 'new'
		end
	end

	def update
		@logic_op = LOGICAL_OP_TBL.find(params[:id])
		if @logic_op.update_attributes(logical_op_params)
			flash[:success] = "Successfully updated logical op #{@logic_op.LOGICAL_OP}"
			redirect_to logical_op_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@logic_op = LOGICAL_OP_TBL.find(params[:id])
		@logic_op.destroy
		flash[:warning] = "Successfully deleted logical op #{@logic_op.LOGICAL_OP}"
		redirect_to logical_op_tbls_path
	end

	private
		def logical_op_params
			params.require(:logical_op_tbl).permit(:LOGICAL_OP)
		end
end
