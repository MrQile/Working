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
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields"
			redirect_to expressions_path
			return
		end
		if  @exprs.update_attributes(expr_params)
			flash[:success] = "Successfully updated expression #{@exprs.EXPR_ID}, #{@exprs.EXPR_TYPE}"
			redirect_to expressions_path
		else
			render 'edit'
		end
	end

	def destroy
		@exprs = EXPRESSION.find(params[:id])
		@exprs.destroy
		flash[:warning] = "Successfully deleted expression #{@exprs.EXPR_ID}, #{@exprs.EXPR_TYPE}"
		redirect_to expressions_path
	end

	def check_unique
		if EXPRESSION.find_by(EXPR_ID: params[:key1],EXPR_TYPE: params[:key2])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end

	private

		def expr_params
			params.require(:expression).permit(:EXPR_ID, :EXPR_TYPE ,:TM_PID ,:REL_OP, :VALUE, :VALUE_TYPE )
		end
end
