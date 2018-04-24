class BaseFormationLogicTblsController < ParentController
before_action :admin_user, only: [:destroy]

	def index
		@base_form_logic = BASE_FORMATION_LOGIC_TBL.all
	end

	def new
		@base_form_logic = BASE_FORMATION_LOGIC_TBL.new
	end

	def edit
		@base_form_logic = BASE_FORMATION_LOGIC_TBL.find(params[:id])
	end

	def create
		@base_form_logic = BASE_FORMATION_LOGIC_TBL.new(base_form_logic_params)
		if @base_form_logic.save
			redirect_to base_formation_logic_tbls_path
		else
			render 'new'
		end
	end

	def update
		@base_form_logic = BASE_FORMATION_LOGIC_TBL.find(params[:id])
		if @base_form_logic.update_attributes(base_form_logic_params)
			redirect_to base_formation_logic_tbls_path
			render 'edit'
		end
	end

	def destroy
		BASE_FORMATION_LOGIC_TBL.find(params[:id]).destroy
		redirect_to base_formation_logic_tbls_path
	end

	private
		def base_form_logic_params
			params.require(:base_formation_logic_tbl).permit(:BASE_FORMATION_LOGIC)
		end
end
