class PrereqConfExprTblsController < ParentController
	before_action :find_base_cmd, except: :destroy
	def index
		@prereqs = @base_cmds.prereq_conf_expr_tbls
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
			redirect_to prereq_conf_expr_tbls_path
		else
			render 'new'
		end
	end

	def update
		@prereqs = PREREQ_CONF_EXPR_TBL.find(params[:id])
		begin
			if @prereqs.update(prereq_params)
				redirect_to prereq_conf_expr_tbls_path
			else
				flash[:danger] = "Doesn't pass validations. Please enter proper data"
				redirect_to edit_prereq_conf_expr_tbl_path
			end
		rescue ActiveRecord::RecordNotUnique => e
			flash[:danger] = "Doesn't Form a unique record"
    		redirect_to edit_prereq_conf_expr_tbl_path
    		return
 		end
	end

	def destroy
		PREREQ_CONF_EXPR_TBL.find(params[:id]).destroy
		redirect_to prereq_conf_expr_tbls_path
	end

	private

		def prereq_params
			params.require(:prereq_conf_expr_tbl).permit(:CMD_ID, :ENTRY_TYPE ,:FIELD_NO ,:EXPR_ID, :LOGICAL_OP)
		end
end