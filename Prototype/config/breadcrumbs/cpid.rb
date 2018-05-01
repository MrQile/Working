crumb :cpid_index do |base_cmd|
	link "Cpids", cpid_tbls_path
	parent :edit_base_cmds, base_cmd
end

crumb :edit_cpid do |base_cmd|
	link "Edit"
	parent :cpid_index, base_cmd
end

crumb :new_cpid do |base_cmd|
	link "New"
	parent :cpid_index, base_cmd
end

#form_data_tbl

crumb :form_data_index do |base_cmd|
	link "Form Logic Data", form_logic_part_data_tbls_path
	parent :edit_base_cmds, base_cmd
end

crumb :edit_form_data do |base_cmd|
	link "Edit"
	parent :form_data_index, base_cmd
end

crumb :new_form_data do |base_cmd|
	link "New"
	parent :form_data_index, base_cmd
end