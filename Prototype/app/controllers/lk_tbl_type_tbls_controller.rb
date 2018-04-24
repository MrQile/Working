class LkTblTypeTblsController < ParentController
	before_action :admin_user, only: [:destroy]

	def index
		@lk_up_type = LK_TBL_TYPE_TBL.all
	end

	def new
		@lk_up_type = LK_TBL_TYPE_TBL.new
	end

	def edit
		@lk_up_type = LK_TBL_TYPE_TBL.find(params[:id])
	end

	def create
		@lk_up_type = LK_TBL_TYPE_TBL.new(lk_tbl_type_params)
		if @lk_up_type.save
			redirect_to lk_tbl_type_tbls_path
		else
			render 'new'
		end
	end

	def update
		@lk_up_type = LK_TBL_TYPE_TBL.find(params[:id])
		if @lk_up_type.update_attributes(lk_tbl_type_params)
			redirect_to lk_tbl_type_tbls_path
			render 'edit'
		end
	end

	def destroy
		LK_TBL_TYPE_TBL.find(params[:id]).destroy
		redirect_to lk_tbl_type_tbls_path
	end

	private
		def lk_tbl_type_params
			params.require(:lk_tbl_type_tbl).permit(:LK_TBL_TYPE)
		end
end