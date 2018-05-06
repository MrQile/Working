class MapIdTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil

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
			flash[:success] = "Successfully created map id #{@map_id.MAP_ID}"
			redirect_to map_id_tbls_path
		else
			render 'new'
		end
	end

	def update
		@map_id = MAP_ID_TBL.find(params[:id])
		if @map_id.update_attributes(map_id_params)
			flash[:success] = "Successfully updated map id #{@map_id.MAP_ID}"
			redirect_to map_id_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@map_id = MAP_ID_TBL.find(params[:id])
		@map_id.destroy
		flash[:warning] = "Successfully deleted map id #{@map_id.MAP_ID}"
		redirect_to map_id_tbls_path
	end

	private
		def map_id_params
			params.require(:map_id_tbl).permit(:MAP_ID,:MAP_BIT)
		end
end