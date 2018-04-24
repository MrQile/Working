crumb :cmd_part_index do |base_cmd,cmd_part|
	link "Index Cmd Part of Base Cmd ", cmd_part_tbls_path
	parent :root, base_cmd
end

crumb :show_cmd_part do |base_cmd,cmd_part|
	link "Show CMD part #{cmd_part.CMD_ID}"
	parent :cmd_part_index, [base_cmd,cmd_part]
end

crumb :edit_cmd_part do |base_cmd,cmd_part|
	link "Edit Cmd Part #{cmd_part.CMD_ID}"
	parent :cmd_part_index, [base_cmd,cmd_part]
end

crumb :new_cmd_part do |base_cmd,cmd_part|
	link "New Cmd Part", new_cmd_part_tbl_path
	parent :cmd_part_index, [base_cmd,cmd_part]
end

crumb :new_bit_info do |base_cmd,cmd_part|
	link "New Bit Sel Info"
	parent :new_cmd_part, [base_cmd,cmd_part]
end

crumb :show_bit_sel_info do |base_cmd,bit_sel|
	link "Show Bit Sel Info", bit_sel_tbl_info_path(bit_sel)
	parent :new_cmd_part, base_cmd
end

crumb :bit_sel_index do |base_cmd,bit_sel|
	link "All Bit Sel Tbls", bit_sel_tbls_path
	parent :show_bit_sel_info, [base_cmd,bit_sel]
end

crumb :new_bit_sel do |base_cmd,bit_sel|
	link "New Bit Sel"
	parent :bit_sel_index, [base_cmd,bit_sel]
end