function palindromeproducts(low::Int, high::Int, smallest::Bool)
	high < low && throw(ArgumentError("invalid range"))
    if smallest
		guess = low^2-1
		while guess ≤ high^2
			guess = first_pal_greater(guess)
			ans = divisorsinrange(guess, low, high)
			if !isempty(ans)
				return guess, ans
			end
		end
		return nothing, []
	else
		guess = high^2+1
		while guess ≥ low^2
			guess = first_pal_less(guess)
			ans = divisorsinrange(guess, low, high)
			if !isempty(ans)
				return guess, ans
			end
		end
		return nothing, []
	end
end

function divisorsinrange(n, low, high)
	ans = []
	for d in max(low, ceil(Int, n//high)):isqrt(n)	#if d is a divisor, it will be the smaller one.
		div, rem = divrem(n,d)
		if rem == 0
			push!(ans, [d,div])
		end
	end
	return ans
end

"""
    pal(n, even=true)
Returns the palindromic integer that starts with `n` of even length if `even=true`, otherwise returns the palindrome of odd length.
Returns `0` if `n=0`. Works fine for negative `n` -- returns a negative answer with palindromic digits.
"""
function pal(n, even=true)
	digs = digits(n)
	l = length(digs)
	if even
		return n*10^l+sum(d*10^(l-i) for (i,d) in enumerate(digs))
	else
		return n*10^(l-1)+sum(init=0,digs[i]*10^(l-i) for i in 2:l)
	end
end

"""
    first_pal_less(n)
returns the first palindromic integer less than `n` which is assumed non-negative.
(Maybe should return data suitable to feed to `pal()`, rather than the palindrome)
"""
function first_pal_less(n)
	nd = ndigits(n)
	if iseven(nd)
		front = n ÷ (10^(nd÷2))
		ans = pal(front)
		if ans < n
			return ans
		else
			if front > 10^(nd÷2-1)
				return pal(front-1)
			else
				return 10^(nd-1)-1 
			end
		end
	else 	# nd is odd
		front = n ÷ (10^((nd-1) ÷2))
		ans = pal(front, false)
		if ans < n
			return ans
		else
			if front > (10^((nd-1) ÷2))
				return pal(front-1, false)
			else
				return 10^(nd-1)-1 
			end
		end
	end
end

"""
    first_pal_greater(n)
returns the first palindromic integer greater than `n` which is assumed non-negative.
(Maybe should return data suitable to feed to `pal()`, rather than the palindrome.)
"""
function first_pal_greater(n)
	nd = ndigits(n)
	if iseven(nd)
		front = n ÷ (10^(nd÷2))
		ans = pal(front)
		if ans > n
			return ans
		else
			if front < 10^(nd÷2)-1
				return pal(front+1)
			else
				return 10^(nd)+1 
			end
		end
	else 	# nd is odd
		front = n ÷ (10^((nd-1) ÷2))
		ans = pal(front, false)
		if ans > n
			return ans
		else
			if front < (10^((nd+1) ÷2))
				return pal(front+1, false)
			else
				return 10^(nd)+1 
			end
		end
	end
end