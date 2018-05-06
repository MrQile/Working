Rails.application.routes.draw do
	root "sessions#new"
	resources :subsystem_tbls do
		post :check_unique, on: :collection
		match :search, to: 'subsystem_tbls#index', via: :post, on: :collection
	end	
	resources :ui_types_tbls do
		post :check_unique, on: :collection
		match :search, to: 'ui_types_tbls#index', via: :post, on: :collection
	end
	resources :cmd_types_tbls do
		post :check_unique, on: :collection
		match :search, to: 'cmd_types_tbls#index', via: :post, on: :collection
	end
	resources :confirmation_type_tbls do
		match :search, to: 'confirmation_type_tbls#index', via: :post, on: :collection
	end
	resources :expressions do
		post :check_unique, on: :collection
		match :search, to: 'expressions#index', via: :post, on: :collection
	end
	resources :cmd_part_types_tbls do
		match :search, to: 'cmd_part_types_tbls#index', via: :post, on: :collection
	end
		
	resources :base_cmd_tbls do
		post :sub_short_name, on: :collection
		post :check_unique, on: :collection
		match :search, to: 'base_cmd_tbls#index', via: [:get, :post], on: :collection
	end
	resources :cmd_part_tbls do
		post :check_unique, on: :collection
	end
	resources :prereq_conf_expr_tbls do
		post :check_unique, on: :collection
	end
	resources :cpid_tbls do
		post :check_unique, on: :collection
	end

	resources :bit_sel_tbl_infos do
		post :check_unique, on: :collection
		match :search, to: 'bit_sel_tbl_infos#index', via: :post, on: :collection
	end
	resources :bit_sel_tbls do
		post :check_unique, on: :collection
	end
	
	resources :lkup_tbls do
		post :check_unique, on: :collection
	end
	resources :lkup_tbl_infos do
		post :check_unique, on: :collection
		match :search, to: 'lkup_tbl_infos#index', via: :post, on: :collection
	end
	
	resources :users
	resources :satellite_tables
	
	resources :sessions, only: [:new, :create, :destroy] do
		post :get_db_details, on: :collection

	end
	get '/login', to: "sessions#new"
	post '/login', to: "sessions#create"
	delete '/logout',  to: 'sessions#destroy'
	get  '/signup',  to: 'users#new'
  	post '/signup',  to: 'users#create'

  	get '/versions', to: "versions#index"
  	resources :versions, only: :destroy

  	resources :base_formation_logic_tbls
  	resources :map_id_tbls
  	resources :part_type_tbls
  	resources :input_format_tbls
  	resources :preferrable_decoder_tbls
  	resources :criticality_tbls
  	resources :pulse_width_tbls
  	resources :lkup_tbl_type_tbls
  	resources :logical_op_tbls

  	resources :entry_type_tbls
  	resources :value_type_tbls
  	resources :rel_op_tbls
  	resources :form_logic_part_type_tbls
  	resources :formation_logic_tbls
  	resources :form_logic_part_data_tbls do
  		post :check_unique, on: :collection
  		post :fetch_sub_logic_val, on: :collection
 	end
  	resources :expr_type_tbls
  	
end
