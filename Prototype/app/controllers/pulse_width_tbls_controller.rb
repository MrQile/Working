class PulseWidthTblsController < ParentController
	before_action :admin_user, only: [:destroy]

	def index
		@pulse_width= PULSE_WIDTH_TBL.all
	end

	def new
		@pulse_width = PULSE_WIDTH_TBL.new
	end

	def edit
		@pulse_width = PULSE_WIDTH_TBL.find(params[:id])
	end

	def create
		@pulse_width = PULSE_WIDTH_TBL.new(pulse_width_params)
		if @pulse_width.save
			redirect_to pulse_width_tbls_path
		else
			render 'new'
		end
	end

	def update
		@pulse_width = PULSE_WIDTH_TBL.find(params[:id])
		if @pulse_width.update_attributes(pulse_width_params)
			redirect_to pulse_width_tbls_path
			render 'edit'
		end
	end

	def destroy
		PULSE_WIDTH_TBL.find(params[:id]).destroy
		redirect_to pulse_width_tbls_path
	end

	private
		def pulse_width_params
			params.require(:pulse_width_tbl).permit(:PULSE_WIDTH)
		end
end
