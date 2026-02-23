function sieve(limit::Integer)
    sarray = trues(limit); sarray[1] = false
    primes = Integer[]
    while any(sarray)
	nextprime = findfirst(sarray)
	push!(primes, nextprime)
	for strike in nextprime:nextprime:limit
	    sarray[strike] = false
	end
    end
    return primes
end
