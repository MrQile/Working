class BitSelTblsController < ParentController
	
	def index
		@bit_sels = BIT_SEL_TBL.where(BIT_SEL_TBL_NO: params[:bits])
	end

	def new
		@bit_sels = BIT_SEL_TBL.new(BIT_SEL_TBL_NO: params[:bits])
	end

	def show
		@bit_sels = BIT_SEL_TBL.find(params[:id])
	end

	def edit
		@bit_sels = BIT_SEL_TBL.find(params[:id])
	end

	def create
		@bit_sels = BIT_SEL_TBL.new(bit_sel_params)
		if @bit_sels.save
			redirect_to bit_sel_tbls_path(bits: @bit_sels)
		else
			render 'new'
		end
	end

	def update
		@bit_sels = BIT_SEL_TBL.find(params[:id])
		if @bit_sels.update_attributes(bit_sel_params)
			redirect_to bit_sel_tbls_url
		else
			render 'edit'
		end
	end

	def destroy
		BIT_SEL_TBL.find(params[:id]).destroy
		redirect_to bit_sel_tbls_url
	end

	private

		def bit_sel_params
			params.require(:bit_sel_tbl).permit(:BIT_SEL_TBL_NO, :FIELD_NO, :START_BIT, :NO_OF_BITS ,:VALUE ,:FIELD_MNEMONICS, :VALUE_MNEMONICS, :LOGICAL_OP)
		end
end