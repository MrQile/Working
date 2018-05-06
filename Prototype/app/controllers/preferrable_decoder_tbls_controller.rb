class PreferrableDecoderTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil

	def index
		@pref_decoder = PREFERRABLE_DECODER_TBL.all
	end

	def new
		@pref_decoder = PREFERRABLE_DECODER_TBL.new
	end

	def edit
		@pref_decoder = PREFERRABLE_DECODER_TBL.find(params[:id])
	end

	def create
		@pref_decoder = PREFERRABLE_DECODER_TBL.new(preferrable_decoder_params)
		if @pref_decoder.save
			flash[:success] = "Successfully created preferreable decoder #{@pref_decoder.PREFERRABLE_DECODER}"
			redirect_to preferrable_decoder_tbls_path
		else
			render 'new'
		end
	end

	def update
		@pref_decoder = PREFERRABLE_DECODER_TBL.find(params[:id])
		if @pref_decoder.update_attributes(preferrable_decoder_params)
			flash[:success] = "Successfully updated preferreable decoder #{@pref_decoder.PREFERRABLE_DECODER}"
			redirect_to preferrable_decoder_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@pref_decoder = PREFERRABLE_DECODER_TBL.find(params[:id])
		@pref_decoder.destroy
		flash[:warning] = "Successfully deleted preferreable decoder #{@pref_decoder.PREFERRABLE_DECODER}"
		redirect_to preferrable_decoder_tbls_path
	end

	private
		def preferrable_decoder_params
			params.require(:preferrable_decoder_tbl).permit(:PREFERRABLE_DECODER)
		end
end