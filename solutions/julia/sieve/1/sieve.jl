function sieve(limit::Integer)
    sarray = trues(limit)
    sarray[1] = false
    primes = Integer[]
    while any(sarray)
	nextprime = findfirst(sarray)
	strike = nextprime
	push!(primes, nextprime)
	while strike <= limit
	    sarray[strike] = false
	    strike += nextprime
	end
    end
    return primes
end
