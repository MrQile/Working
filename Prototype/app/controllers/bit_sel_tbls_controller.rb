class BitSelTblsController < ParentController
	before_action :find_base_cmd, except: :destroy
	before_action :bit_sel_var, except: :destroy
	def index
		@bit_sels = BIT_SEL_TBL.where(BIT_SEL_TBL_NO: session[:bit_id])
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
			flash[:success] = "Successfully created cpid #{@bit_sels.BIT_SEL_TBL_NO}, #{@bit_sels.FIELD_NO}"
			redirect_to bit_sel_tbls_path
		else
			render 'new'
		end
	end

	def update
		begin
			@bit_sels = BIT_SEL_TBL.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Caution: Take extra care while changing key fields. Please start afresh"
			redirect_to bit_sel_tbls_path
			return
		end
		begin
			if  @bit_sels.update_attributes(bit_sel_params)
				flash[:success] = "Successfully updated cpid #{@bit_sels.BIT_SEL_TBL_NO}, #{@bit_sels.FIELD_NO}"
				redirect_to bit_sel_tbls_path
			else
				render 'edit'
			end
		rescue ActiveRecord::RecordNotUnique => e
			flash[:danger] = "Doesn't Form a unique record"
    		redirect_to edit_bit_sel_tbl_path
    		return
 		end
	end
		

	def destroy
		BIT_SEL_TBL.find(params[:id]).destroy
		redirect_to bit_sel_tbls_path
	end

	private

		def bit_sel_params
			params.require(:bit_sel_tbl).permit(:BIT_SEL_TBL_NO, :FIELD_NO, :START_BIT, :BIT_MASK, :NO_OF_BITS ,:VALUE ,:FIELD_MNEMONICS, :VALUE_MNEMONICS, :LOGICAL_OP)
		end

		def bit_sel_var
			@bit_infos = BIT_SEL_TBL_INFO.find(session[:bit_id])
		end
end