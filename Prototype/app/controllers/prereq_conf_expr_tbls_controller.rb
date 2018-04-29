class PrereqConfExprTblsController < ParentController
	before_action :find_base_cmd, only: [:index, :show, :new, :edit]
	def index
		@prereqs = @base_cmds.prereq_conf_expr_tbls
	end

	def new
		@prereqs = PREREQ_CONF_EXPR_TBL.new(CMD_ID: session[:cmd_id])
	end

	def show
		@prereqs = PREREQ_CONF_EXPR_TBL.find(params[:id])
	end

	def edit
		@prereqs = PREREQ_CONF_EXPR_TBL.find(params[:id])
	end

	def create
		@prereqs = PREREQ_CONF_EXPR_TBL.new(prereq_params)
		if @prereqs.save
			redirect_to @prereqs
		else
			render 'new'
		end
	end

	def update
		@prereqs = PREREQ_CONF_EXPR_TBL.find(params[:id])
		if @prereqs.update_attributes(prereq_params)
			redirect_to prereq_conf_expr_tbls_url
		else
			render 'edit'
		end
	end

	def destroy
		PREREQ_CONF_EXPR_TBL.find(params[:id]).destroy
		redirect_to prereq_conf_expr_tbls_url
	end

	private

		def prereq_params
			params.require(:prereq_conf_expr_tbl).permit(:CMD_ID, :ENTRY_TYPE ,:FIELD_NO ,:EXPR_ID, :LOGICAL_OP)
		end
end