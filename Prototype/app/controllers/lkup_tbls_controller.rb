class LkupTblsController < ParentController

	def index
		@lkups = LKUP_TBL.where(LKUP_TBL_NO: session[:lkup_id])
	end

	def new
		@lkups = LKUP_TBL.new(LKUP_TBL_NO: session[:lkup_id])
	end

	def show
		@lkups = LKUP_TBL.find(params[:id])
	end

	def edit
		@lkups = LKUP_TBL.find(params[:id])
	end

	def create
		@lkups = LKUP_TBL.new(lkup_params)
		if @lkups.save
			redirect_to lkup_tbls_path
		else
			render 'new'
		end
	end

	def update
		@lkups = LKUP_TBL.find(params[:id])
		if @lkups.update_attributes(lkup_params)
			redirect_to lkup_tbls_url
		else
			render 'edit'
		end
	end

	def destroy
		LKUP_TBL.find(params[:id]).destroy
		redirect_to lkup_tbls_url
	end

	private

		def lkup_params
			params.require(:lkup_tbl).permit(:LKUP_TBL_NO, :LKUP_ENTRY_INDEX , :BYTE_CODE, :VALUE)
		end
end
