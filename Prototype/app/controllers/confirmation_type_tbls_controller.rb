class ConfirmationTypeTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil

	def index
		session[:cmd_id] = 0
		@search = CONFIRMATION_TYPE_TBL.ransack(params[:q])
		@confs = @search.result
		@search.build_condition
	end

	def new
		@confs = CONFIRMATION_TYPE_TBL.new
	end

	def show
		@confs = CONFIRMATION_TYPE_TBL.find(params[:id])
	end

	def edit
		@confs = CONFIRMATION_TYPE_TBL.find(params[:id])
	end

	def create
		@confs = CONFIRMATION_TYPE_TBL.new(conf_params)
		if @confs.save
			flash[:success] = "Successfully created confirmation type #{@confs.CONFIRMATION_TYPE}"
			redirect_to confirmation_type_tbls_path
		else
			render 'new'
		end
	end

	def update
		@confs = CONFIRMATION_TYPE_TBL.find(params[:id])
		if @confs.update_attributes(conf_params)
			flash[:success] = "Successfully updated confirmation type #{@confs.CONFIRMATION_TYPE}"
			redirect_to confirmation_type_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@confs = CONFIRMATION_TYPE_TBL.find(params[:id])
		@confs.destroy
		flash[:warning] = "Successfully deleted confirmation type #{@confs.CONFIRMATION_TYPE}"
		redirect_to confirmation_type_tbls_path
	end

	private

		def conf_params
			params.require(:confirmation_type_tbl).permit(:BIT_POSITION, :CONFIRMATION_TYPE, :BIT_VAL)
		end
end
