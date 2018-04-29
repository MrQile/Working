class BitSelTblInfosController < ParentController
	before_action :find_base_cmd, only: [:index, :show, :new, :edit]
	def index
		@search = BIT_SEL_TBL_INFO.ransack(params[:q])
		@bit_infos = @search.result
		@search.build_condition
	end

	def new
		@bit_infos = BIT_SEL_TBL_INFO.new
	end

	def show
		if params[:bits].blank?
			@bit_infos = BIT_SEL_TBL_INFO.find(params[:id])
		else
			@bit_infos = BIT_SEL_TBL_INFO.find(BIT_SEL_TBL_NO: params[:val])
		end
	end

	def edit
		@bit_infos = BIT_SEL_TBL_INFO.find(params[:id])
	end

	def create
		@bit_infos = BIT_SEL_TBL_INFO.new(bit_sel_info_params)
		if @bit_infos.save
			redirect_to @bit_infos
		else
			render 'new'
		end
	end

	def update
		@bit_infos = BIT_SEL_TBL_INFO.find(params[:id])
		if @bit_infos.update_attributes(bit_sel_info_params)
			redirect_to bit_sel_tbl_infos_url
		else
			render 'edit'
		end
	end

	def destroy
		BIT_SEL_TBL_INFO.find(params[:id]).destroy
		redirect_to bit_sel_tbl_infos_url
	end

	private

		def bit_sel_info_params
			params.require(:bit_sel_tbl_info).permit(:BIT_SEL_TBL_NO, :BIT_SEL_TBL_NAME)
		end
end
