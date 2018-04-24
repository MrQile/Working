class LogicalOpTblsController < ParentController
	before_action :admin_user, only: [:destroy]

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
			redirect_to logical_op_tbls_path
		else
			render 'new'
		end
	end

	def update
		@logic_op = LOGICAL_OP_TBL.find(params[:id])
		if @logic_op.update_attributes(logical_op_params)
			redirect_to logical_op_tbls_path
			render 'edit'
		end
	end

	def destroy
		LOGICAL_OP_TBL.find(params[:id]).destroy
		redirect_to logical_op_tbls_path
	end

	private
		def logical_op_params
			params.require(:logical_op_tbl).permit(:LOGICAL_OP)
		end
end
