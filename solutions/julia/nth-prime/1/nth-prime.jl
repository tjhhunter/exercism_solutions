function isprime(n)
	n < 2 && return false
	n == 2 && return true
	for i in 2:sqrt(n)
		rem(n,i) == 0 && return false
	end
	return true
end

function prime(n)
    n== 0 && error("No such prime!")
	pcount = 0
	ncount = 1
	while pcount < n
		ncount +=1
		isprime(ncount) && (pcount +=1)
	end
	return ncount
end