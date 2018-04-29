class ExprTypeTblsController < ParentController
	before_action :admin_user, only: [:destroy]
	before_action :set_base_cmd_session_to_nil

	def index
		@expr_type = EXPR_TYPE_TBL.all
	end

	def new
		@expr_type = EXPR_TYPE_TBL.new
	end

	def edit
		@expr_type = EXPR_TYPE_TBL.find(params[:id])
	end

	def create
		@expr_type = EXPR_TYPE_TBL.new(expr_type_params)
		if @expr_type.save
			redirect_to expr_type_tbls_path
		else
			render 'new'
		end
	end

	def update
		@expr_type = EXPR_TYPE_TBL.find(params[:id])
		if @expr_type.update_attributes(expr_type_params)
			redirect_to expr_type_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		EXPR_TYPE_TBL.find(params[:id]).destroy
		redirect_to expr_type_tbls_path
	end

	private
		def expr_type_params
			params.require(:expr_type_tbl).permit(:ID, :EXPR_TYPE)
		end
end
