"""
A list of strings corresponding to the minesweeper board specified by `rows`
after it has been annotated with integers representing the number of mines adjacent
to each location.
"""
function annotate(rows)
    isempty(rows) && return([])
    lr,lr1 = length(rows), length(rows[1])
    ans = Array{String,2}(undef,lr,lr1)
    for r in 1:lr
	for c in 1:lr1
	    rmin, rmax,cmin,cmax = max(r-1,1), min(r+1,lr), max(c-1,1),min(c+1,lr1)
	    ans[r,c] = string(rows[r][c])
	end
    end
    for r in 1:lr
	for c in 1:lr1
	    if ans[r,c] == " "
		cnt = count(
		    i->(i=="*"),
		    view(ans,max(1,r-1):min(r+1,lr),max(1,c-1):min(c+1,lr1))
		)
		cnt > 0 && (ans[r,c] = string(cnt))
	    end
	end
    end
    return [join(view(ans,r,:)) for r in 1:lr]
end
