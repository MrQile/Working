class ExpressionsController < ParentController

	def index
		@search = EXPRESSION.ransack(params[:q])
		@exprs = @search.result
		@search.build_condition
	end

	def new
		@exprs = EXPRESSION.new
	end

	def show
		@exprs = EXPRESSION.find(params[:id])
	end

	def edit
		@exprs = EXPRESSION.find(params[:id])
	end

	def create
		@exprs = EXPRESSION.new(expr_params)
		if @exprs.save
			redirect_to new_prereq_conf_expr_tbl_path
		else
			render 'new'
		end
	end

	def update
		@exprs = EXPRESSION.find(params[:id])
		if @exprs.update_attributes(expr_params)
			redirect_to expressions_url
		else
			render 'edit'
		end
	end

	def destroy
		EXPRESSION.find(params[:id]).destroy
		redirect_to expressions_url
	end

	private

		def expr_params
			params.require(:expression).permit(:EXPR_ID, :EXPR_TYPE ,:TM_PID ,:REL_OP, :VALUE, :VALUE_TYPE )
		end
end
