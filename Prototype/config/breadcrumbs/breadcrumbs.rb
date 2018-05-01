#Add gretel gem currently using 3.0.9
#run rails generate gretel:install to get this file

crumb :root do
  link "Home", base_cmd_tbls_path
end

crumb :new_base_cmds do
	link "New", new_base_cmd_tbl_path
	parent :root
end

crumb :edit_base_cmds do |base_cmd|
	link "Edit", edit_base_cmd_tbl_path(base_cmd)
	parent :root
end

# crumb :preconf_index do |preconf,base_cmd|
# 	link "Index Preconf of Base Cmd ", prereq_conf_expr_tbls_path
# 	parent :base_cmds, base_cmd
# end

# crumb :show_preconf do |preconf,base_cmd|
# 	link "Show Preconf #{preconf.CMD_ID}"
# 	parent :preconf_index, [preconf,base_cmd]
# end

# crumb :edit_preconf do |preconf,base_cmd|
# 	link "Edit Preconf #{preconf.CMD_ID}"
# 	parent :preconf_index, [preconf,base_cmd]
# end

# crumb :new_preconf do |preconf, base_cmd|
# 	link "New Preconf", new_prereq_conf_expr_tbl_path
# 	parent :preconf_index, [preconf,base_cmd]
# end

# crumb :new_expr do
# 	link "Expr"
# 	parent :new_preconf
# end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).