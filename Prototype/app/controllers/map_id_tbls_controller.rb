class MapIdTblsController < ParentController
	before_action :admin_user, only: [:destroy]

	def index
		@map_id = MAP_ID_TBL.all
	end

	def new
		@map_id = MAP_ID_TBL.new
	end

	def edit
		@map_id = MAP_ID_TBL.find(params[:id])
	end

	def create
		@map_id = MAP_ID_TBL.new(map_id_params)
		if @map_id.save
			redirect_to map_id_tbls_path
		else
			render 'new'
		end
	end

	def update
		@map_id = MAP_ID_TBL.find(params[:id])
		if @map_id.update_attributes(map_id_params)
			redirect_to map_id_tbls_path
			render 'edit'
		end
	end

	def destroy
		MAP_ID_TBL.find(params[:id]).destroy
		redirect_to map_id_tbls_path
	end

	private
		def map_id_params
			params.require(:map_id_tbl).permit(:MAP_ID)
		end
end