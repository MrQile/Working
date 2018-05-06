class SatelliteTablesController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil

	def index
		@sat = SATELLITE_TABLE.all
	end

	def new
		@sat = SATELLITE_TABLE.new
	end

	def edit
		@sat = SATELLITE_TABLE.find(params[:id])
	end

	def create
		@sat = SATELLITE_TABLE.new(sat_params)
		if @sat.save
			flash[:success] = "Successfully created satellite #{@sat.SATNAME}"
			redirect_to satellite_tables_path
		else
			render 'new'
		end
	end

	def update
		@sat = SATELLITE_TABLE.find(params[:id])
		if @sat.update_attributes(sat_params)
			flash[:success] = "Successfully updated satellite #{@sat.SATNAME}"
			redirect_to satellite_tables_path
		else
			render 'edit'
		end
	end

	def destroy
		@sat = SATELLITE_TABLE.find(params[:id]).destroy
		@sat.destroy
		flash[:warning] = "Successfully deleted satellite #{@sat.SATNAME}"
		redirect_to satellite_tables_path
	end

	private
		def sat_params
			params.require(:satellite_table).permit(:SATNAME, :SCSHORTNAME, :EDIT_ENABLE, :CCSDS_FLAG, :DB_NAME, :DB_USERNAME, :DB_PASSWORD)
		end
end