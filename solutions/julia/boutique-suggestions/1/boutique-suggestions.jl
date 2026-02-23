clothingitem(cs, qs) = Dict([(cs[i], qs[i]) for i in 1:length(cs)])
get_combinations(tops, bottoms) = [(i,j) for i in tops, j in bottoms]

function get_prices(m)
	ans = ones(size(m))
	for i in eachindex(m)
		ans[i] = sum(x["price"] for x in m[i])
	end
	return ans
end

function filter_clashing(m) 
    return [m[i] for i in eachindex(m) if 
            m[i][1]["base_color"] != m[i][2]["base_color"]]
end