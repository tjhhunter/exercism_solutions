function demote(n)
	if n isa Float64
		return ceil(UInt8, n)
	elseif n isa Integer
		return(Int8(n))
	else
		throw(MethodError(demote, (n,)))
	end
end
function preprocess(coll)
	if coll isa Vector
		return reverse(demote.(coll))
	elseif coll isa Set
		return sort(demote.(collect(coll)), rev=true)
	else
		throw(MethodError(preprocess, (coll,)))
	end
end