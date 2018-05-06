class BitSelTblsController < ParentController
	before_action :find_base_cmd, except: :destroy
	before_action :bit_sel_var, except: :destroy
	def index
		if params[:val] == "1"
			session[:cmd_id] = 0
			session[:bit_id] = 0
			@bit_sels = BIT_SEL_TBL.all
		else
			@bit_sels = BIT_SEL_TBL.where(BIT_SEL_TBL_NO: session[:bit_id])
		end
	end

	def new
		@bit_sels = BIT_SEL_TBL.new(BIT_SEL_TBL_NO: session[:bit_id])
	end

	def edit
		@bit_sels = BIT_SEL_TBL.find(params[:id])
	end

	def create
		@bit_sels = BIT_SEL_TBL.new(bit_sel_params)
		if @bit_sels.save
			flash[:success] = "Successfully created bit sel #{@bit_sels.BIT_SEL_TBL_NO}, #{@bit_sels.FIELD_NO}"
			redirect_to bit_sel_tbls_path
		else
			render 'new'
		end
	end

	def update
		begin
			@bit_sels = BIT_SEL_TBL.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields"
			redirect_to bit_sel_tbls_path
			return
		end
		if  @bit_sels.update_attributes(bit_sel_params)
			flash[:success] = "Successfully updated bit sel #{@bit_sels.BIT_SEL_TBL_NO}, #{@bit_sels.FIELD_NO}"
			redirect_to bit_sel_tbls_path
		else
			render 'edit'
		end
	end
		

	def destroy
		@bit_sels = BIT_SEL_TBL.find(params[:id])
		@bit_sels.destroy
		flash[:warning] = "Successfully deleted bit sel #{@bit_sels.BIT_SEL_TBL_NO}, #{@bit_sels.FIELD_NO}"
		redirect_to bit_sel_tbls_path
	end

	def check_unique
		if BIT_SEL_TBL.find_by(BIT_SEL_TBL_NO: params[:key1],FIELD_NO: params[:key2])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end

	private

		def bit_sel_params
			params.require(:bit_sel_tbl).permit(:BIT_SEL_TBL_NO, :FIELD_NO, :START_BIT, :BIT_MASK, :NO_OF_BITS ,:VALUE ,:FIELD_MNEMONICS, :VALUE_MNEMONICS, :LOGICAL_OP)
		end

		def bit_sel_var
			if session[:bit_id].present? && session[:bit_id]!=0
				@bit_infos = BIT_SEL_TBL_INFO.find(session[:bit_id])
			end
		end
end