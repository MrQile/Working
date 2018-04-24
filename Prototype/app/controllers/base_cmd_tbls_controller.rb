class BaseCmdTblsController < ParentController
	before_action :admin_user, only: :destroy

	def index
		session[:cmd_id] = 0
		@confirmer = CONFIRMER_TBL.all
		@confirmer_hash = Hash[ @confirmer.map { |c| [c.POSITION,c.NAME] }].stringify_keys!
		# @confirmer_hash.stringify_keys!
		@search = BASE_CMD_TBL.ransack(params[:q])
		@search.build_condition
		if params[:column].present?

			@column = params[:column]
			@column_entry = params[:column_entry]
			@base_cmds = @search.result.where(@column => @column_entry).includes(:subsystem_tbl, :ui_types_tbl, :cmd_types_tbl).paginate(page: params[:page], :per_page => 30)

		elsif params[:Base].present?		 #Use .has_key? if the param is of boolean type :true or :false 

			@base_cmds = @search.result.paginate(page: params[:page], :per_page => 20).includes(:subsystem_tbl, :ui_types_tbl, :cmd_types_tbl)

		elsif params[:BitSel].present?

			name = params[:BitSelTblName]
			@base_cmds = BASE_CMD_TBL.joins("INNER JOIN CMD_PART_TBL ON (CMD_PART_TBL.CMD_ID = BASE_CMD_TBL.CMD_ID) AND (CMD_PART_TBL.CMD_PART_TYPE = 1) INNER JOIN BIT_SEL_TBL_INFO ON (BIT_SEL_TBL_INFO.BIT_SEL_TBL_NO = CMD_PART_TBL.RESOLUTION) AND (BIT_SEL_TBL_INFO.BIT_SEL_TBL_NAME LIKE '%#{name}%')").paginate(page: params[:page], :per_page => 20)

			# Alternate between this sql statement or one of Lkup to find which suits best on large scale database
		
		elsif params[:Lkup].present?

			name = params[:LkupTblName]
			@base_cmds = BASE_CMD_TBL.joins(:cmd_part_tbls).joins("INNER JOIN LKUP_TBL_INFO ON (LKUP_TBL_INFO.LKUP_TBL_NO = CMD_PART_TBL.RESOLUTION) AND (LKUP_TBL_INFO.LKUP_TBL_NAME LIKE '%#{name}%')").paginate(page: params[:page], :per_page => 20)
			
		else
			@base_cmds = @search.result.includes(:subsystem_tbl, :ui_types_tbl, :cmd_types_tbl).paginate(page: params[:page], :per_page => 15)
		end
	end

	def new
		@base_cmds = BASE_CMD_TBL.new
	end

	def show
		@base_cmds = BASE_CMD_TBL.find(session[:cmd_id])
	end

	def edit
		@base_cmds = BASE_CMD_TBL.find(params[:id])
		session[:cmd_id] = @base_cmds.CMD_ID
	end

	def create
		@base_cmds = BASE_CMD_TBL.new(base_cmd_params)
		if @base_cmds.save
			redirect_to base_cmd_tbls_path
		else
			render 'new'
		end
	end

	def update
		if params[:commit] == "Create"	
			@base_cmds = BASE_CMD_TBL.new(base_cmd_params)
			if @base_cmds.save
				redirect_to base_cmd_tbls_path
			else
				render 'edit'
			end
		else
			@base_cmds = BASE_CMD_TBL.find(params[:id])
			if @base_cmds.update_attributes(base_cmd_params)
				redirect_to base_cmd_tbls_path
			else
				render 'edit'
			end
		end
	end

	def destroy
		BASE_CMD_TBL.find(params[:id]).destroy
		redirect_to base_cmd_tbls_path
	end


	# Used a ajax call for initializing cmd_id on single click of record
	# def save_cmd
	# 	session[:cmd_id] = params[:base_id]
	# 	respond_to do |format|
	# 		format.js
	# 	end
	# end

	private
		def base_cmd_params
			params.require(:base_cmd_tbl).permit(:CMD_ID, :DESCRIPTION  , :SUBSYSTEM  , :FORMATION_TYPE  , :CMD_TYPE  , :BASE_CMD_CODE  , :BASE_CMD_MASK  , :CRITICALITY  , :PULSE_WIDTH  , :MAP_ID  , :UI_TYPE, :PREFERRABLE_DECODER, {CONFIRMATION_TYPE: []} , :REMARKS)
		end
end