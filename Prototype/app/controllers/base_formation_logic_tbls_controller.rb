class BaseFormationLogicTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil


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
			flash[:success] = "Successfully created base formation logic #{@base_form_logic.BASE_FORMATION_LOGIC}"
			redirect_to base_formation_logic_tbls_path
		else
			render 'new'
		end
	end

	def update
		@base_form_logic = BASE_FORMATION_LOGIC_TBL.find(params[:id])
		if @base_form_logic.update_attributes(base_form_logic_params)
			flash[:success] = "Successfully updated base formation logic #{@base_form_logic.BASE_FORMATION_LOGIC}"
			redirect_to base_formation_logic_tbls_path
		else
				render 'edit'
		end
	end

	def destroy
		@base_form_logic = BASE_FORMATION_LOGIC_TBL.find(params[:id])
		@base_form_logic.destroy
		flash[:warning] = "Successfully deleted base formation logic #{@base_form_logic.BASE_FORMATION_LOGIC}"
		redirect_to base_formation_logic_tbls_path
	end

	private
		def base_form_logic_params
			params.require(:base_formation_logic_tbl).permit(:BASE_FORMATION_LOGIC)
		end
end
