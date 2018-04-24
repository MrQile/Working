class PartTypeTblsController < ParentController
	before_action :admin_user, only: [:destroy]

	def index
		@part_type = PART_TYPE_TBL.all
	end

	def new
		@part_type = PART_TYPE_TBL.new
	end

	def edit
		@part_type = PART_TYPE_TBL.find(params[:id])
	end

	def create
		@part_type = PART_TYPE_TBL.new(part_type_params)
		if @part_type.save
			redirect_to part_type_tbls_path
		else
			render 'new'
		end
	end

	def update
		@part_type = PART_TYPE_TBL.find(params[:id])
		if @part_type.update_attributes(part_type_params)
			redirect_to part_type_tbls_path
			render 'edit'
		end
	end

	def destroy
		PART_TYPE_TBL.find(params[:id]).destroy
		redirect_to part_type_tbls_path
	end

	private
		def part_type_params
			params.require(:part_type_tbl).permit(:PART_TYPE)
		end
end
