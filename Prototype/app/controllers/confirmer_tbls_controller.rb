class ConfirmerTblsController < ParentController

	def index
		session[:cmd_id] = 0
		@search = CONFIRMER_TBL.ransack(params[:q])
		@confs = @search.result
		@search.build_condition
	end

	def new
		@confs = CONFIRMER_TBL.new
	end

	def show
		@confs = CONFIRMER_TBL.find(params[:id])
	end

	def edit
		@confs = CONFIRMER_TBL.find(params[:id])
	end

	def create
		@confs = CONFIRMER_TBL.new(conf_params)
		if @confs.save
			redirect_to @confs
		else
			render 'new'
		end
	end

	def update
		@confs = CONFIRMER_TBL.find(params[:id])
		if @confs.update_attributes(conf_params)
			redirect_to confirmer_tbls_url
		else
			render 'edit'
		end
	end

	def destroy
		CONFIRMER_TBL.find(params[:id]).destroy
		redirect_to confirmer_tbls_url
	end

	private

		def conf_params
			params.require(:confirmer_tbl).permit(:POSITION, :NAME)
		end
end