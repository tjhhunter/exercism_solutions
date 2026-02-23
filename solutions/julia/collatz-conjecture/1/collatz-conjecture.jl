function collatz_steps(n::Integer)
    n <=0 && throw(DomainError(n))
    ans = 0
    while n != 1
	iseven(n) ? n = n÷2 : n = 3*n + 1
	ans +=1
    end
    ans
end
