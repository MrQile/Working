class BaseCmdTblsController < ParentController
	def index
		session[:cmd_id] = 0
		@map_id = MAP_ID_TBL.all
		@map_id_hash = Hash[ @map_id.map { |c| [c.MAP_BIT, c.MAP_ID]}].stringify_keys!
		@confirmer = CONFIRMATION_TYPE_TBL.all
		@confirmer_hash = Hash[ @confirmer.map { |c| [c.BIT_POSITION,c.CONFIRMATION_TYPE] }].stringify_keys!
		# @confirmer_hash.stringify_keys!
		@search = BASE_CMD_TBL.ransack(params[:q])
		@search.build_condition
		if params[:column].present?

			@column = params[:column]
			@column_entry = params[:column_entry]
			@base_cmds = @search.result.where(@column => @column_entry).paginate(page: params[:page], :per_page => 30)

		elsif params[:ransack_true].present?		 #Use .has_key? if the param is of boolean type :true or :false 

			@base_cmds = @search.result.distinct.paginate(page: params[:page], :per_page => 30)
			@ransack_true = true
			
		elsif params[:BitSel].present?

			name = params[:BitSelTblName]
			@base_cmds = BASE_CMD_TBL.joins("INNER JOIN CMD_PART_TBL ON (CMD_PART_TBL.CMD_ID = BASE_CMD_TBL.CMD_ID) AND (CMD_PART_TBL.CMD_PART_TYPE = 'BIT_SEL_PART_TYPE') INNER JOIN BIT_SEL_TBL_INFO ON (BIT_SEL_TBL_INFO.BIT_SEL_TBL_NO = CMD_PART_TBL.RESOLUTION) AND (BIT_SEL_TBL_INFO.BIT_SEL_TBL_NAME LIKE '%#{name}%')").distinct.paginate(page: params[:page], :per_page => 30)

			# Alternate between this sql statement or one of Lkup to find which suits best on large scale database
		
		elsif params[:Lkup].present?

			name = params[:LkupTblName]
			@base_cmds = BASE_CMD_TBL.joins(:cmd_part_tbls).joins("INNER JOIN LKUP_TBL_INFO ON (CMD_PART_TBL.CMD_PART_TYPE = 'LKUP_PART_TYPE') AND (LKUP_TBL_INFO.LKUP_TBL_NAME LIKE '%#{name}%')").distinct.paginate(page: params[:page], :per_page => 20)
			
		else
			@base_cmds = @search.result.paginate(page: params[:page], :per_page => 30)
		end
	end

	def new
		@base_cmds = BASE_CMD_TBL.new
	end

	def edit
		@base_cmds = BASE_CMD_TBL.find(params[:id])
		session[:cmd_id] = @base_cmds.CMD_ID
	end

	def create
		@base_cmds = BASE_CMD_TBL.new(base_cmd_params)
		if @base_cmds.save
			flash[:success] = "Successfully created base cmd #{@base_cmds.CMD_ID}"
			redirect_to edit_base_cmd_tbl_path(@base_cmds)
		else
			render 'new'
		end
	end

	def update
		if params[:commit] == "Create"	
			@base_cmds = BASE_CMD_TBL.new(base_cmd_params)
			if @base_cmds.save
				flash[:success] = "Successfully created base cmd #{@base_cmds.CMD_ID}"
				redirect_to base_cmd_tbls_path
			else
				render 'edit'
			end
		else
			begin
				@base_cmds = BASE_CMD_TBL.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				flash[:danger] = "Update fail: Make sure all fields are valid before changing the key fields."
				redirect_to base_cmd_tbls_path
				return
			end
			if @base_cmds.update_attributes(base_cmd_params)
				flash[:success] = "Successfully updated base cmd #{@base_cmds.CMD_ID}"
				redirect_to base_cmd_tbls_path
			else
				render 'edit'
			end
		end
	end


	def destroy
		@base_cmds = BASE_CMD_TBL.find(params[:id])
		@base_cmds.destroy
		flash[:warning] = "Successfully deleted base cmd #{@base_cmds.CMD_ID}"
		redirect_to base_cmd_tbls_path
	end


	# Used a ajax call for initializing cmd_id on single click of record
	# def save_cmd
	# 	session[:cmd_id] = params[:base_id]
	# 	respond_to do |format|
	# 		format.js
	# 	end
	# end

	def sub_short_name
		@sub_short = SUBSYSTEM_TBL.where(SUBSYSTEM_NAME: params[:subsystem_name]).pluck(:SUBSYSTEM_SHORT_NAME)*""
		respond_to do |format|
			format.js
		end
	end

	def check_unique
		if BASE_CMD_TBL.find_by(CMD_ID: params[:key])
			render json: { valid: false }
		else
			render json: { valid: true }
		end
	end

	private
		def base_cmd_params
			params.require(:base_cmd_tbl).permit(:CMD_ID, :DESCRIPTION  , :SUBSYSTEM  , :FORMATION_TYPE  , :CMD_TYPE  , :BASE_CMD_CODE  , :BASE_CMD_MASK  , :CRITICALITY  , :PULSE_WIDTH  , :MAP_ID  , :UI_TYPE, :PREFERRABLE_DECODER, {CONFIRMATION_TYPE: []} , :REMARKS)
		end
end