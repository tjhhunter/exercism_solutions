function sum_of_multiples(limit, factors)
	nzfacts = filter(x -> !iszero(x),factors)
	if isempty(nzfacts)
		return 0
	else
		return sum(union((f:f:limit-1 for f in nzfacts)...))
	end
end