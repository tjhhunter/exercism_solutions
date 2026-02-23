function print_name_badge(id,name,dept)
		idstring = ismissing(id) ? "" : "[$(id)] - "
		deptstring = isnothing(dept) ? "OWNER" : uppercase(dept)
	return  idstring * name * " - " * deptstring
end
function salaries_no_id(ids, sals)
	ans = 0
	for i in 1:length(ids)
		ismissing(ids[i]) && (ans += sals[i])
	end
	return ans
end