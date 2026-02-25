"""
    depart(n,first)
Returns a list of all increasing lists of positive integers that end with `first`
and sum to `n`.
"""
function depart(n, frst)
	if frst == n
		return [[n]]
	else return sort.([[frst; x] for x in 
				 vcat([depart(n-frst, i) for i in 
					   min(n-frst,frst-1):-1:isqrt(2(n-frst)-1)]...)])
	end
end

""" 
    depart(n)
Returns a list of all increasing lists of positive integers that sum to `n`.
"""
function depart(n)
	vcat([depart(n,i) for i in n:-1:isqrt(2n-1)]...)
end

function  combinations_in_cage(total, numsquares, restricted=[])
	filter(depart(total)) do x 
		length(x) == numsquares && isempty(x ∩ restricted)
	end
end

