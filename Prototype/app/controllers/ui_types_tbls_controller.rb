class UiTypesTblsController < ParentController
	before_action :admin_user, except: [:index]

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
			redirect_to ui_types_tbls_path
		else
			render 'new'
		end
	end

	def update
		@ui_types = UI_TYPES_TBL.find(params[:id])
		if @ui_types.update_attributes(ui_type_params)
			redirect_to ui_types_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		UI_TYPES_TBL.find(params[:id]).destroy
		redirect_to ui_types_tbls_path
	end

	private

		def ui_type_params
			params.require(:ui_types_tbl).permit(:UI_TYPE_ID, :UI_TYPE)
		end
end

