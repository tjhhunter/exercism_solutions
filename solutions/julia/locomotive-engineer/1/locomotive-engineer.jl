get_vector_of_wagons(args...) = [args...]
fix_vector_of_wagons(ewi, mw) = [ewi[3]; mw; ewi[4:end];ewi[1]; ewi[2]]
function add_missing_stops(r,s...)
	ans = Dict{String}{Any}()
	ans["from"], ans["to"] = r["from"], r["to"]
	ans["stops"] = [p[2] for p in s]
	return ans
end
function extend_route_information(r; mri...)
	ans = Dict{Any}{String}()
	ans["from"], ans["to"] = r["from"], r["to"]
	for p in mri
		ans[p[1]] = p[2]
	end
	return ans
end