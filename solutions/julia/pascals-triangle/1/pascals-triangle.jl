"""
    triangle(i::Integer)
An array with entries the first `i` rows in Pascal's triangle.
"""
function triangle(i::Integer)
	i < 0  && throw(DomainError(i))
	[[binomial(n,k) for k in 0:n] for n in 0:i-1]
end
