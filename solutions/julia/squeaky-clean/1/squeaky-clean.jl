function transform(ch) 
	if ch == '-' 
		return "_" 
	elseif isspace(ch) || isdigit(ch)
		return "" # there is no empty character
	elseif isuppercase(ch)
		return "-$(lowercase(ch))"
	elseif ch ∈ 'α':'ω'
		return "?"
	else
		return string(ch)
	end
end
clean(str) = prod(transform.(collect(str)))