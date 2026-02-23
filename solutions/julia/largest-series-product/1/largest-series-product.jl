function largest_product(str, span)
    span <= 0 && throw(ArgumentError("Invalid span"))
	v = [parse(Integer,c) for c in str]
	return maximum([prod(v[k:span+k-1]) for k in 1:length(str) - span + 1])
end