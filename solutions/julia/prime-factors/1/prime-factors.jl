# we will try to have short code rather than short execution.
# The smallest positive divisor of any integer is prime.

function prime_factors(n::Integer)
    ans = []
    while n > 1
        d = first_divisor(n)
        push!(ans, d)
        n ÷= d
    end
    ans
end

function first_divisor(n::Integer)
    # Note that we need n>1, but we will depend on caller for this.
    d = 2
    while n % d !=0
        d += 1
    end
    return d
end

