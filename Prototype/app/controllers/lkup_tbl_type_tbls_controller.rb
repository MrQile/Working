class LkupTblTypeTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil

	def index
		@lkup_type = LKUP_TBL_TYPE_TBL.all
	end

	def new
		@lkup_type = LKUP_TBL_TYPE_TBL.new
	end

	def edit
		@lkup_type = LKUP_TBL_TYPE_TBL.find(params[:id])
	end

	def create
		@lkup_type = LKUP_TBL_TYPE_TBL.new(lkup_tbl_type_params)
		if @lkup_type.save
			flash[:success] = "Successfully created lkup tbl type #{@lkup_type.LKUP_TBL_TYPE}"
			redirect_to lkup_tbl_type_tbls_path
		else
			render 'new'
		end
	end

	def update
		@lkup_type = LKUP_TBL_TYPE_TBL.find(params[:id])
		if @lkup_type.update_attributes(lkup_tbl_type_params)
			flash[:success] = "Successfully updated lkup tbl type #{@lkup_type.LKUP_TBL_TYPE}"
			redirect_to lkup_tbl_type_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@lkup_type = LKUP_TBL_TYPE_TBL.find(params[:id])
		@lkup_type.destroy
		flash[:warning] = "Successfully deleted lkup tbl type #{@lkup_type.LKUP_TBL_TYPE}"
		redirect_to lkup_tbl_type_tbls_path
	end

	private
		def lkup_tbl_type_params
			params.require(:lkup_tbl_type_tbl).permit(:LKUP_TBL_TYPE)
		end

end