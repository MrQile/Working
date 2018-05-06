class FormLogicPartDataTblsController < ParentController
	before_action :find_base_cmd, except: :destroy
	def index
		if params[:val] == "1"
			session[:cmd_id] = 0
			@form_logic_data = FORM_LOGIC_PART_DATA_TBL.all
		else
			@form_logic_data = @base_cmds.form_logic_part_data_tbls	
		end
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
			flash[:success] = "Successfully created form data #{@form_logic_data.CMD_ID}, #{@form_logic_data.PART_NO}, #{@form_logic_data.LOGIC_LEVEL}"
			redirect_to form_logic_part_data_tbls_path
		else
			render 'new'
		end
	end

	def update
 		 begin
			@form_logic_data = FORM_LOGIC_PART_DATA_TBL.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields"
			redirect_to form_logic_part_data_tbls_path
			return
		end
		if  @form_logic_data.update_attributes(form_logic_data_params)
			flash[:success] = "Successfully updated form data #{@form_logic_data.CMD_ID}, #{@form_logic_data.PART_NO}, #{@form_logic_data.LOGIC_LEVEL}"
			redirect_to form_logic_part_data_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@form_logic_data = FORM_LOGIC_PART_DATA_TBL.find(params[:id])
		@form_logic_data.destroy
		flash[:warning] = "Successfully deleted form data #{@form_logic_data.CMD_ID}, #{@form_logic_data.PART_NO}, #{@form_logic_data.LOGIC_LEVEL}"
		redirect_to form_logic_part_data_tbls_path
	end

	def fetch_sub_logic_val
		@logic_level = FORMATION_LOGIC_TBL.where(FORMATION_LOGIC: params[:form_logic_name]).pluck(:FORMATION_LOGIC_LEVEL)*""
		render json: { logic_value: @logic_level }
	end

	def check_unique
		if FORM_LOGIC_PART_DATA_TBL.find_by(CMD_ID: params[:key1],PART_NO: params[:key2],LOGIC_LEVEL: params[:key3])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end	

	private
		def form_logic_data_params
			params.require(:form_logic_part_data_tbl).permit(:CMD_ID, :PART_NO, :LOGIC_LEVEL, :LOGIC_PART_NO, :FORM_LOGIC_PART_TYPE, :PART_MNEMONIC, :SUB_LOGIC_TYPE, :PART_TYPE, :START_BIT, :NO_OF_BITS, :PART_MASK, :RESOLUTION, :OFFSET , :INPUT_FORMAT, :LL, :UL , :UNITS, :REMARKS)
		end
end