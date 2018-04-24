class InputFormatTblsController < ParentController
	before_action :admin_user, only: [:destroy]

	def index
		@input_format = INPUT_FORMAT_TBL.all
	end

	def new
		@input_format = INPUT_FORMAT_TBL.new
	end

	def edit
		@input_format = INPUT_FORMAT_TBL.find(params[:id])
	end

	def create
		@input_format = INPUT_FORMAT_TBL.new(input_format_params)
		if @input_format.save
			redirect_to input_format_tbls_path
		else
			render 'new'
		end
	end

	def update
		@input_format = INPUT_FORMAT_TBL.find(params[:id])
		if @input_format.update_attributes(input_format_params)
			redirect_to input_format_tbls_path
			render 'edit'
		end
	end

	def destroy
		INPUT_FORMAT_TBL.find(params[:id]).destroy
		redirect_to input_format_tbls_path
	end

	private
		def input_format_params
			params.require(:input_format_tbl).permit(:INPUT_FORMAT)
		end
end
