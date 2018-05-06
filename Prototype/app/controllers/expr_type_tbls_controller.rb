class ExprTypeTblsController < ParentController
	before_action :admin_user, except: :index
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
			flash[:success] = "Successfully created expr type #{@expr_type.EXPR_TYPE}"
			redirect_to expr_type_tbls_path
		else
			render 'new'
		end
	end

	def update
		@expr_type = EXPR_TYPE_TBL.find(params[:id])
		if @expr_type.update_attributes(expr_type_params)
			flash[:success] = "Successfully updated expr type #{@expr_type.EXPR_TYPE}"
			redirect_to expr_type_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@expr_type = EXPR_TYPE_TBL.find(params[:id])
		@expr_type.destroy
		flash[:warning] = "Successfully deleted expr type #{@expr_type.EXPR_TYPE}"
		redirect_to expr_type_tbls_path
	end

	private
		def expr_type_params
			params.require(:expr_type_tbl).permit(:EXPR_TYPE)
		end
end
