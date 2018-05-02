class ExpressionsController < ParentController
	before_action :find_base_cmd, except: :destroy
	before_action :set_base_cmd_session_to_nil, only: :index
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
			flash[:success] = "Successfully created expression #{@exprs.EXPR_ID}, #{@exprs.EXPR_TYPE}"
			redirect_to edit_expression_path(@exprs)
		else
			render 'new'
		end
	end

	def update
		begin
			@exprs = EXPRESSION.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Caution: Take extra care while changing key fields. Please start afresh"
			redirect_to expressions_path
			return
		end
		begin
			if  @exprs.update_attributes(expr_params)
				flash[:success] = "Successfully updated expression #{@exprs.EXPR_ID}, #{@exprs.EXPR_TYPE}"
				redirect_to expressions_path
			else
				render 'edit'
			end
		rescue ActiveRecord::RecordNotUnique => e
			flash[:danger] = "Doesn't Form a unique record"
    		redirect_to edit_expression_path
    		return
 		end
	end

		

	def destroy
		EXPRESSION.find(params[:id]).destroy
		redirect_to expressions_path
	end

	private

		def expr_params
			params.require(:expression).permit(:EXPR_ID, :EXPR_TYPE ,:TM_PID ,:REL_OP, :VALUE, :VALUE_TYPE )
		end
end
