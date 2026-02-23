function sieve(limit::Integer)
    sarray = trues(limit); sarray[1] = false
    primes = Integer[]
    while any(sarray)
	nextprime = findfirst(sarray)
	push!(primes, nextprime)
	sarray[nextprime] = false
	for strike in nextprime^2:nextprime:limit
	    sarray[strike] = false
	end
    end
    return primes
end
