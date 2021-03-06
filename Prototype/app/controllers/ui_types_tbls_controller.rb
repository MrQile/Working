class UiTypesTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil

	def index
		session[:cmd_id] = 0
		@search = UI_TYPES_TBL.ransack(params[:q])
		@ui_types = @search.result
		@search.build_condition
	end

	def new
		@ui_types = UI_TYPES_TBL.new
	end

	def show
		@ui_types = UI_TYPES_TBL.find(params[:id])
	end

	def edit
		@ui_types = UI_TYPES_TBL.find(params[:id])
	end

	def create
		@ui_types = UI_TYPES_TBL.new(ui_type_params)
		if @ui_types.save
			flash[:success] = "Successfully created ui type #{@ui_types.UI_TYPE}"
			redirect_to ui_types_tbls_path
		else
			render 'new'
		end
	end

	def update
		begin
			@ui_types = UI_TYPES_TBL.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields."
			redirect_to ui_types_tbls_path
			return
		end
		if @ui_types.update_attributes(ui_type_params)
			flash[:success] = "Successfully updated ui type #{@ui_types.UI_TYPE}"
			redirect_to ui_types_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@ui_types = UI_TYPES_TBL.find(params[:id])
		@ui_types.destroy
		flash[:warning] = "Successfully deleted ui type #{@ui_types.UI_TYPE}"
		redirect_to ui_types_tbls_path
	end

	def check_unique
		if UI_TYPES_TBL.find_by(UI_TYPE: params[:key])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end

	private

		def ui_type_params
			params.require(:ui_types_tbl).permit(:UI_TYPE_ID, :UI_TYPE)
		end
end

