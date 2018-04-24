class LkupTblInfosController < ParentController

	def index
		@search = LKUP_TBL_INFO.ransack(params[:q])
		@lkup_infos = @search.result
		@search.build_condition
	end

	def new
		@lkup_infos = LKUP_TBL_INFO.new
	end

	def show
		@lkup_infos = LKUP_TBL_INFO.find(params[:id])
		save_lkup @lkup_infos
	end

	def edit
		@lkup_infos = LKUP_TBL_INFO.find(params[:id])
	end

	def create
		@lkup_infos = LKUP_TBL_INFO.new(lkup_info_params)
		if @lkup_infos.save
			redirect_to @lkup_infos
		else
			render 'new'
		end
	end

	def update
		@lkup_infos = LKUP_TBL_INFO.find(params[:id])
		if @lkup_infos.update_attributes(lkup_info_params)
			redirect_to lkup_tbl_infos_url
		else
			render 'edit'
		end
	end

	def destroy
		LKUP_TBL_INFO.find(params[:id]).destroy
		redirect_to lkup_tbl_infos_url
	end

	private

		def lkup_info_params
			params.require(:lkup_tbl_info).permit(:LKUP_TBL_NO, :LKUP_TBL_NAME ,:LKUP_TBL_TYPE)
		end
end