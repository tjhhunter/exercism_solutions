# we will try to have short code rather than short execution.

"isperfect(n::Integer)::Bool   = abundance(n) == 0"
isperfect(n::Integer)::Bool   = abundance(n) == 0

"isabundant(n::Integer)::Bool  = abundance(n) >  0"
isabundant(n::Integer)::Bool  = abundance(n) >  0

"isdeficient(n::Integer)::Bool = abundance(n) <  0"
isdeficient(n::Integer)::Bool = abundance(n) <  0

"abundance(n::Integer)::Integer = sum(divisors(n)) - 2n"
abundance(n::Integer)::Integer = sum(divisors(n)) - 2n

"""
    divisors(n::Integer)::Set{<:Integer}
The set of divisors of `n`.
Raises DomainError if `n` is less than 1.
"""
function divisors(n::Integer)::Set{<:Integer}
    n < 1 && throw(DomainError(n))
    n == 1 && return Set(1)
    d = first_divisor(n)
    s = divisors(n÷d)
    union(Set(d*t for t in s), s)
end



"""
    first_divisor(n::Integer)::Integer
    The smallest proper divisor of `n.`
    We need n>1, but we will depend on caller for this.smallest 
"""
function first_divisor(n::Integer)::Integer
    # 
    d = 2
    while n % d !=0
        d += 1
    end
    return d
end


