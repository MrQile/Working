class FormationLogicTblsController < ParentController
	before_action :admin_user, except: :index
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
			flash[:success] = "Successfully created form logic #{@form_logic.FORMATION_LOGIC}"
			redirect_to formation_logic_tbls_path
		else
			render 'new'
		end
	end

	def update
		@form_logic = FORMATION_LOGIC_TBL.find(params[:id])
		if @form_logic.update_attributes(form_logic_params)
			flash[:success] = "Successfully updated form logic #{@form_logic.FORMATION_LOGIC}"
			redirect_to formation_logic_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@form_logic = FORMATION_LOGIC_TBL.find(params[:id])
		@form_logic.destroy
		flash[:warning] = "Successfully deleted form logic #{@form_logic.FORMATION_LOGIC}"
		redirect_to formation_logic_tbls_path
	end

	private
		def form_logic_params
			params.require(:formation_logic_tbl).permit(:FORMATION_LOGIC,:FORMATION_LOGIC_LEVEL)
		end
end
