class FormLogicPartDataTblsController < ParentController
	before_action :find_base_cmd, except: :destroy
	def index
		@form_logic_data = @base_cmds.form_logic_part_data_tbls	
	end

	def new
		@form_logic_data = FORM_LOGIC_PART_DATA_TBL.new(CMD_ID: session[:cmd_id])
	end

	def edit
		@form_logic_data = FORM_LOGIC_PART_DATA_TBL.find(params[:id])
	end

	def create
		@form_logic_data = FORM_LOGIC_PART_DATA_TBL.new(form_logic_data_params)
		if @form_logic_data.save
			redirect_to form_logic_part_data_tbls_path
		else
			render 'new'
		end
	end

	def update
		@form_logic_data = FORM_LOGIC_PART_DATA_TBL.find(params[:id])
		if @form_logic_data.update_attributes(form_logic_data_params)
			redirect_to form_logic_part_data_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		FORM_LOGIC_PART_DATA_TBL.find(params[:id]).destroy
		redirect_to form_logic_part_data_tbls_path
	end

	def fetch_sub_logic_val
		@logic_level = FORMATION_LOGIC_TBL.where(FORMATION_LOGIC: params[:form_logic_name]).pluck(:FORMATION_LOGIC_LEVEL)*""
		respond_to do |format|
			format.js
		end
	end

	private
		def form_logic_data_params
			params.require(:form_logic_part_data_tbl).permit(:CMD_ID, :PART_NO, :LOGIC_LEVEL, :LOGIC_PART_NO, :FORM_LOGIC_PART_TYPE, :PART_MNEMONIC, :SUB_LOGIC_TYPE, :PART_TYPE, :START_BIT, :NO_OF_BITS, :PART_MASK, :RESOLUTION, :OFFSET , :INPUT_FORMAT, :LL, :UL , :UNITS, :REMARKS)
		end
end