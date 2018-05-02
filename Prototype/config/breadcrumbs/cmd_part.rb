crumb :cmd_part_index do |base_cmd|
	link "Cmd Parts", cmd_part_tbls_path
	parent :edit_base_cmds, base_cmd
end

crumb :edit_cmd_part do |base_cmd|
	link "Edit"
	parent :cmd_part_index, base_cmd
end

crumb :new_cmd_part do |base_cmd|
	link "New"
	parent :cmd_part_index, base_cmd
end

# bit sels
crumb :new_bit_info do |base_cmd|
	link "New Bit Info"
	parent :edit_base_cmds, base_cmd
end

crumb :edit_bit_sel_info do |base_cmd,bit_sel|
	link "Edit Bit Info", edit_bit_sel_tbl_info_path(bit_sel)
	parent :edit_base_cmds, base_cmd
end

crumb :bit_sel_index do |base_cmd,bit_sel|
	link "Bit Sels", bit_sel_tbls_path
	parent :edit_bit_sel_info, [base_cmd,bit_sel]
end

crumb :new_bit_sel do |base_cmd,bit_sel|
	link "New Bit Sel"
	parent :bit_sel_index, [base_cmd,bit_sel]
end

crumb :edit_bit_sel do |base_cmd,bit_sel|
	link "Edit Bit Sel"
	parent :bit_sel_index, [base_cmd,bit_sel]
end

# lk ups
crumb :new_lkup_info do |base_cmd|
	link "New Lkup Info"
	parent :edit_base_cmds, base_cmd
end

crumb :edit_lkup_info do |base_cmd,lkup|
	link "Edit Lkup Info", edit_lkup_tbl_info_path(lkup)
	parent :edit_base_cmds, base_cmd
end

crumb :lkup_index do |base_cmd,lkup|
	link "Lkups", lkup_tbls_path
	parent :edit_lkup_info, [base_cmd,lkup]
end

crumb :new_lkup do |base_cmd,lkup|
	link "New Lkup"
	parent :lkup_index, [base_cmd,lkup]
end

crumb :edit_lkup do |base_cmd,lkup|
	link "Edit Lkup"
	parent :lkup_index, [base_cmd,lkup]
end
