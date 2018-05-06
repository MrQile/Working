class PrereqConfExprTblsController < ParentController
	before_action :find_base_cmd, except: :destroy
	def index
		if params[:val] == "1"
			session[:cmd_id] = 0
			@prereqs = PREREQ_CONF_EXPR_TBL.all
		else
			@prereqs = @base_cmds.prereq_conf_expr_tbls	
		end
	end

	def new
		@prereqs = PREREQ_CONF_EXPR_TBL.new(CMD_ID: session[:cmd_id])
	end

	def edit
		@prereqs = PREREQ_CONF_EXPR_TBL.find(params[:id])
	end

	def create
		@prereqs = PREREQ_CONF_EXPR_TBL.new(prereq_params)
		if @prereqs.save
			flash[:success] = "Successfully created prereqs #{@prereqs.CMD_ID}, #{@prereqs.ENTRY_TYPE} ,#{@prereqs.FIELD_NO}"
			redirect_to prereq_conf_expr_tbls_path
		else
			render 'new'
		end
	end

	def update
 		begin
			@prereqs = PREREQ_CONF_EXPR_TBL.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields"
			redirect_to prereq_conf_expr_tbls_path
			return
		end
		if @prereqs.update(prereq_params)
			flash[:success] = "Successfully updated prereqs #{@prereqs.CMD_ID}, #{@prereqs.ENTRY_TYPE} ,#{@prereqs.FIELD_NO}"
			redirect_to prereq_conf_expr_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@prereqs = PREREQ_CONF_EXPR_TBL.find(params[:id])
		@prereqs.destroy
		flash[:warning] = "Successfully deleted prereqs #{@prereqs.CMD_ID}, #{@prereqs.ENTRY_TYPE} ,#{@prereqs.FIELD_NO}"
		redirect_to prereq_conf_expr_tbls_path
	end

	def check_unique
		if PREREQ_CONF_EXPR_TBL.find_by(CMD_ID: params[:key1],ENTRY_TYPE: params[:key2],FIELD_NO: params[:key3])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end

	private

		def prereq_params
			params.require(:prereq_conf_expr_tbl).permit(:CMD_ID, :ENTRY_TYPE ,:FIELD_NO ,:EXPR_ID, :LOGICAL_OP)
		end
end