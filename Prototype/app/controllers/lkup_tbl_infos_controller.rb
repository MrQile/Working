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
			redirect_to edit_lkup_tbl_info_path(@lkup_infos)
		else
			render 'new'
		end
	end

	def update
		@lkup_infos = LKUP_TBL_INFO.find(params[:id])
		if @lkup_infos.update_attributes(lkup_info_params)
			redirect_to lkup_tbl_infos_path
		else
			render 'edit'
		end
	end

	def destroy
		LKUP_TBL_INFO.find(params[:id]).destroy
		redirect_to lkup_tbl_infos_path
	end

	private

		def lkup_info_params
			params.require(:lkup_tbl_info).permit(:LKUP_TBL_NO, :LKUP_TBL_NAME ,:LKUP_TBL_TYPE)
		end
end