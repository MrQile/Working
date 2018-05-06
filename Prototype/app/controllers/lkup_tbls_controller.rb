class LkupTblsController < ParentController
	before_action :find_base_cmd, except: :destroy
	before_action :lkup_var, except: :destroy

	def index
		if params[:val] == "1"
			session[:cmd_id] = 0
			session[:lkup_id] = 0
			@lkups = LKUP_TBL.all
		else
			@lkups = LKUP_TBL.where(LKUP_TBL_NO: session[:lkup_id])
		end
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
			flash[:success] = "Successfully created lkup #{@lkups.LKUP_TBL_NO}, #{@lkups.LKUP_ENTRY_INDEX}"
			redirect_to lkup_tbls_path
		else
			render 'new'
		end
	end

	def update
 		begin
			@lkups = LKUP_TBL.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields"
			redirect_to lkup_tbls_path
			return
		end
		if  @lkups.update_attributes(lkup_params)
			flash[:success] = "Successfully updated lkup #{@lkups.LKUP_TBL_NO}, #{@lkups.LKUP_ENTRY_INDEX}"
			redirect_to lkup_tbls_path
		else
			render 'edit'
		end
	end
		

	def destroy
		@lkups = LKUP_TBL.find(params[:id])
		@lkups.destroy
		flash[:warning] = "Successfully deleted lkup #{@lkups.LKUP_TBL_NO}, #{@lkups.LKUP_ENTRY_INDEX}"
		redirect_to lkup_tbls_path
	end

	def check_unique
		if LKUP_TBL.find_by(LKUP_TBL_NO: params[:key1],LKUP_ENTRY_INDEX: params[:key2])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end
	
	private

		def lkup_params
			params.require(:lkup_tbl).permit(:LKUP_TBL_NO, :LKUP_ENTRY_INDEX , :BYTE_CODE, :VALUE)
		end

		def lkup_var
			if session[:lkup_id].present? && session[:lkup_id]!=0
				@lkup_infos = LKUP_TBL_INFO.find(session[:lkup_id])
			end
		end
end
