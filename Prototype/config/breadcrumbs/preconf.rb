crumb :preconf_index do |base_cmd,preconf|
	link "Index Preconf of Base Cmd ", prereq_conf_expr_tbls_path
	parent :root, base_cmd
end

crumb :show_preconf do |base_cmd,preconf|
	link "Show Preconf #{preconf.CMD_ID}"
	parent :preconf_index, [base_cmd,preconf]
end

crumb :edit_preconf do |base_cmd,preconf|
	link "Edit Preconf #{preconf.CMD_ID}"
	parent :preconf_index, [base_cmd,preconf]
end

crumb :new_preconf do |base_cmd,preconf|
	link "New Preconf", new_prereq_conf_expr_tbl_path
	parent :preconf_index, [base_cmd,preconf]
end

crumb :new_expr do |base_cmd|
	link "Expr"
	parent :new_preconf, base_cmd
end