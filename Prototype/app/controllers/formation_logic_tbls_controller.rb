class FormationLogicTblsController < ParentController
	before_action :admin_user, only: [:destroy]
	before_action :set_base_cmd_session_to_nil

	def index
		@form_logic = FORMATION_LOGIC_TBL.all
	end

	def new
		@form_logic = FORMATION_LOGIC_TBL.new
	end

	def edit
		@form_logic = FORMATION_LOGIC_TBL.find(params[:id])
	end

	def create
		@form_logic = FORMATION_LOGIC_TBL.new(form_logic_params)
		if @form_logic.save
			redirect_to formation_logic_tbls_path
		else
			render 'new'
		end
	end

	def update
		@form_logic = FORMATION_LOGIC_TBL.find(params[:id])
		if @form_logic.update_attributes(form_logic_params)
			redirect_to formation_logic_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		FORMATION_LOGIC_TBL.find(params[:id]).destroy
		redirect_to formation_logic_tbls_path
	end

	private
		def form_logic_params
			params.require(:formation_logic_tbl).permit(:FORMATION_LOGIC,:FORMATION_LOGIC_LEVEL)
		end
end
