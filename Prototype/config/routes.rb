Rails.application.routes.draw do
	root "sessions#new"
	resources :subsystem_tbls do
		match :search, to: 'subsystem_tbls#index', via: :post, on: :collection
	end	
	resources :ui_types_tbls do
		match :search, to: 'ui_types_tbls#index', via: :post, on: :collection
	end
	resources :cmd_types_tbls do
		match :search, to: 'cmd_types_tbls#index', via: :post, on: :collection
	end
	resources :confirmation_type_tbls do
		match :search, to: 'confirmation_type_tbls#index', via: :post, on: :collection
	end
	resources :expressions do
		match :search, to: 'expressions#index', via: :post, on: :collection
	end
	resources :cmd_part_types_tbls do
		match :search, to: 'cmd_part_types_tbls#index', via: :post, on: :collection
	end
		
	resources :base_cmd_tbls do
		post :sub_short_name, on: :collection
		match :search, to: 'base_cmd_tbls#index', via: [:get, :post], on: :collection
	end
	resources :cmd_part_tbls
	resources :prereq_conf_expr_tbls
	resources :cpid_tbls

	resources :bit_sel_tbl_infos do
		match :search, to: 'bit_sel_tbl_infos#index', via: :post, on: :collection
	end
	resources :bit_sel_tbls
	
	resources :lkup_tbls
	resources :lkup_tbl_infos do
		match :search, to: 'lkup_tbl_infos#index', via: :post, on: :collection
	end
	
	resources :users
	
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
  	resources :lk_tbl_type_tbls
  	resources :logical_op_tbls

end
