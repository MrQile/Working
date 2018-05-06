class InputFormatTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil

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
			flash[:success] = "Successfully created input format #{@input_format.INPUT_FORMAT}"
			redirect_to input_format_tbls_path
		else
			render 'new'
		end
	end

	def update
		@input_format = INPUT_FORMAT_TBL.find(params[:id])
		if @input_format.update_attributes(input_format_params)
			flash[:success] = "Successfully updated input format #{@input_format.INPUT_FORMAT}"
			redirect_to input_format_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@input_format = INPUT_FORMAT_TBL.find(params[:id])
		@input_format.destroy
		flash[:warning] = "Successfully deleted input format #{@input_format.INPUT_FORMAT}"
		redirect_to input_format_tbls_path
	end

	private
		def input_format_params
			params.require(:input_format_tbl).permit(:INPUT_FORMAT)
		end
end
