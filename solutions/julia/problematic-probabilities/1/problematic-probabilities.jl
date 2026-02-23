rationalize(l,m) = l .// m
probabilities(l,m) = l ./ m
function checkmean(l,m)
	n = length(l)
	rat = sum(l .// m) // n
	rea = sum(l ./ m) / n
	if float(rat) == rea
		return true
	else
		return rat
	end
end
function checkprob(l,m)
	rat = prod(l .// m)
	rea = prod(l ./ m)
	if float(rat) == rea
		return true
	else
		return rat
	end
end