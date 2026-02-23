function recite(lst)
	isempty(lst) && return ""
	l = ["For want of a $(lst[i]) the $(lst[i+1]) was lost." 
		 for i in 1: length(lst) - 1]
	push!(l, "And all for the want of a $(lst[1]).")
	return join(l, "\n")
end