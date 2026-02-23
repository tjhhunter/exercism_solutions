function luhn(str)
    nospace = replace(str, " "=>"")
    l = length(nospace)
    (occursin(r"[^0-9]",nospace) || l <=1) && return false
    s=0
    for k in 1:l
	d = parse(Int,nospace[k])
	if isodd(k+l)
	    d *=2
	    if d>9
		d-=9
	    end
	end
	s+=d
    end
    s % 10 == 0
end


