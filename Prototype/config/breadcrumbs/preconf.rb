crumb :preconf_index do |base_cmd|
	link "Preconfs ", prereq_conf_expr_tbls_path
	parent :edit_base_cmds, base_cmd
end

crumb :edit_preconf do |base_cmd|
	link "Edit"
	parent :preconf_index, base_cmd
end

crumb :new_preconf do |base_cmd|
	link "New", new_prereq_conf_expr_tbl_path
	parent :preconf_index, base_cmd
end

crumb :new_expr do |base_cmd|
	link "New Expression"
	parent :preconf_index, base_cmd
end

crumb :edit_expr do |base_cmd|
	link "Edit Expression"
	parent :preconf_index, base_cmd
end