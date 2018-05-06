class BitSelTblInfosController < ParentController
	before_action :find_base_cmd, except: :destroy
	before_action :set_base_cmd_session_to_nil, only: :index
	def index
		@search = BIT_SEL_TBL_INFO.ransack(params[:q])
		@bit_infos = @search.result
		@search.build_condition
	end

	def new
		@bit_infos = BIT_SEL_TBL_INFO.new
	end

	def edit
		@bit_infos = BIT_SEL_TBL_INFO.find(params[:id])
		save_bit @bit_infos
	end

	def create
		@bit_infos = BIT_SEL_TBL_INFO.new(bit_sel_info_params)
		if @bit_infos.save
			flash[:success] = "Successfully created bit sel info #{@bit_infos.BIT_SEL_TBL_NO}"
			redirect_to edit_bit_sel_tbl_info_path(@bit_infos)
		else
			render 'new'
		end
	end

	def update
		begin
			@bit_infos = BIT_SEL_TBL_INFO.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields."
			redirect_to bit_sel_tbl_infos_path
			return
		end
		if @bit_infos.update_attributes(bit_sel_info_params)
			flash[:success] = "Successfully updated bit sel info #{@bit_infos.BIT_SEL_TBL_NO}"
			redirect_to bit_sel_tbl_infos_path
		else
			render 'edit'
		end
	end

	def destroy
		@bit_infos = BIT_SEL_TBL_INFO.find(params[:id])
		@bit_infos.destroy
		flash[:warning] = "Successfully deleted bit sel info #{@bit_infos.BIT_SEL_TBL_NO}"
		redirect_to bit_sel_tbl_infos_path
	end

	def check_unique
		if BIT_SEL_TBL_INFO.find_by(BIT_SEL_TBL_NO: params[:key])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end

	private

		def bit_sel_info_params
			params.require(:bit_sel_tbl_info).permit(:BIT_SEL_TBL_NO, :BIT_SEL_TBL_NAME)
		end
end
