class FormLogicPartTypeTblsController < ParentController
	before_action :admin_user, only: [:destroy]
	before_action :set_base_cmd_session_to_nil

	def index
		@form_logic_part = FORM_LOGIC_PART_TYPE_TBL.all
	end

	def new
		@form_logic_part = FORM_LOGIC_PART_TYPE_TBL.new
	end

	def edit
		@form_logic_part = FORM_LOGIC_PART_TYPE_TBL.find(params[:id])
	end

	def create
		@form_logic_part = FORM_LOGIC_PART_TYPE_TBL.new(form_logic_part_params)
		if @form_logic_part.save
			redirect_to form_logic_part_type_tbls_path
		else
			render 'new'
		end
	end

	def update
		@form_logic_part = FORM_LOGIC_PART_TYPE_TBL.find(params[:id])
		if @form_logic_part.update_attributes(form_logic_part_params)
			redirect_to form_logic_part_type_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		FORM_LOGIC_PART_TYPE_TBL.find(params[:id]).destroy
		redirect_to form_logic_part_type_tbls_path
	end

	private
		def form_logic_part_params
			params.require(:form_logic_part_type_tbl).permit(:FORM_LOGIC_PART_TYPE)
		end
end
