class EntryTypeTblsController < ParentController
	before_action :admin_user, except: :index
	before_action :set_base_cmd_session_to_nil


	def index
		@entry_type = ENTRY_TYPE_TBL.all
	end

	def new
		@entry_type = ENTRY_TYPE_TBL.new
	end

	def edit
		@entry_type = ENTRY_TYPE_TBL.find(params[:id])
	end

	def create
		@entry_type = ENTRY_TYPE_TBL.new(entry_type_params)
		if @entry_type.save
			flash[:success] = "Successfully created entry type #{@entry_type.ENTRY_TYPE}"
			redirect_to entry_type_tbls_path
		else
			render 'new'
		end
	end

	def update
		@entry_type = ENTRY_TYPE_TBL.find(params[:id])
		if @entry_type.update_attributes(entry_type_params)
			flash[:success] = "Successfully updated entry type #{@entry_type.ENTRY_TYPE}"
			redirect_to entry_type_tbls_path
		else
			render 'edit'
		end
	end

	def destroy
		@entry_type = ENTRY_TYPE_TBL.find(params[:id])
		@entry_type.destroy
		flash[:warning] = "Successfully deleted entry type #{@entry_type.ENTRY_TYPE}"
		redirect_to entry_type_tbls_path
	end

	private
		def entry_type_params
			params.require(:entry_type_tbl).permit(:ENTRY_TYPE)
		end
end
