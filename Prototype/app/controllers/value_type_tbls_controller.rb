class ValueTypeTblsController < ParentController
	before_action :admin_user, only: [:destroy]
	before_action :set_base_cmd_session_to_nil

	def index
		@value_type = VALUE_TYPE_TBL.all
	end

	def new
		@value_type = VALUE_TYPE_TBL.new
	end

	def edit
		@value_type = VALUE_TYPE_TBL.find(params[:id])
	end

	def create
		@value_type = VALUE_TYPE_TBL.new(value_type_params)
		if @value_type.save
			redirect_to value_type_tbls_path
		else
			render 'new'
		end
	end

	def update
		@value_type = VALUE_TYPE_TBL.find(params[:id])
		if @value_type.update_attributes(value_type_params)
			redirect_to value_type_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		VALUE_TYPE_TBL.find(params[:id]).destroy
		redirect_to value_type_tbls_path
	end

	private
		def value_type_params
			params.require(:value_type_tbl).permit(:VALUE_TYPE)
		end
end