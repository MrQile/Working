class LkupTblInfosController < ParentController
	before_action :find_base_cmd, except: :destroy
	before_action :set_base_cmd_session_to_nil, only: :index
	def index
		@search = LKUP_TBL_INFO.ransack(params[:q])
		@lkup_infos = @search.result
		@search.build_condition
	end

	def new
		@lkup_infos = LKUP_TBL_INFO.new
	end

	def edit
		@lkup_infos = LKUP_TBL_INFO.find(params[:id])
		save_lkup @lkup_infos
	end

	def create
		@lkup_infos = LKUP_TBL_INFO.new(lkup_info_params)
		if @lkup_infos.save
			flash[:success] = "Successfully created lkup info #{@lkup_infos.LKUP_TBL_NO}"
			redirect_to edit_lkup_tbl_info_path(@lkup_infos)
		else
			render 'new'
		end
	end

	def update
		begin
			@lkup_infos = LKUP_TBL_INFO.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields."
			redirect_to lkup_tbl_infos_path
			return
		end
		if @lkup_infos.update_attributes(lkup_info_params)
			flash[:success] = "Successfully updated lkup info #{@lkup_infos.LKUP_TBL_NO}"
			redirect_to lkup_tbl_infos_path
		else
			render 'edit'
		end
	end

	def destroy
		@lkup_infos = LKUP_TBL_INFO.find(params[:id])
		@lkup_infos.destroy
		flash[:warning] = "Successfully deleted lkup info #{@lkup_infos.LKUP_TBL_NO}"
		redirect_to lkup_tbl_infos_path
	end

	def check_unique
		if LKUP_TBL_INFO.find_by(LKUP_TBL_NO: params[:key])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end

	private

		def lkup_info_params
			params.require(:lkup_tbl_info).permit(:LKUP_TBL_NO, :LKUP_TBL_NAME ,:LKUP_TBL_TYPE)
		end
end