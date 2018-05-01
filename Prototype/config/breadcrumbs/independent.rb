
# For Bit tables
crumb :bit_infos do
	link "Bit Infos", bit_sel_tbl_infos_path
	parent :root
end

crumb :bit_info_new do
	link "New"
	parent :bit_infos
end

crumb :bit_info_edit do |bit_info|
	link "Edit" , edit_bit_sel_tbl_info_path(bit_info)
	parent :bit_infos
end

crumb :bit_sels do |bit_info|
	link "Bit Sels", bit_sel_tbls_path
	parent :bit_info_edit, bit_info
end

crumb :bit_sel_new do |bit_info|
	link "New"
	parent :bit_sels, bit_info
end

crumb :bit_sel_edit do |bit_info|
	link "Edit"
	parent :bit_sels, bit_info
end

# For Lkup tables
crumb :lkup_infos do
	link "Lkup Infos", lkup_tbl_infos_path
	parent :root
end

crumb :lkup_info_new do
	link "New"
	parent :lkup_infos
end

crumb :lkup_info_edit do |lkup|
	link "Edit" , edit_lkup_tbl_info_path(lkup)
	parent :lkup_infos
end

crumb :lkups do |lkup|
	link "Lkups", lkup_tbls_path
	parent :lkup_info_edit, lkup
end

crumb :lkup_new do |lkup|
	link "New"
	parent :lkups, lkup
end

crumb :lkup_edit do |lkup|
	link "Edit"
	parent :lkups, lkup
end

# For Expression tables
crumb :exprs do
	link "Expressions", expressions_path
	parent :root
end

crumb :expr_new do
	link "New Expression"
	parent :exprs
end

crumb :expr_edit do
	link "Edit Expression"
	parent :exprs
end