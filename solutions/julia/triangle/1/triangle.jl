""" 
    is_equilateral(a::Real, b::Real, c::Real) 
Returns `true` if `a`,`b`,`c` are the sides of an equilateral triangle; i.e. they are equal and positive.
"""
is_equilateral(a::Real, b::Real, c::Real) = 0 < a == b == c

"""
    is_equilateral(sides::Array{<:Real,1}) = is_equilateral(sides...)
"""
is_equilateral(sides::Array{<:Real,1}) = is_equilateral(sides...)


""" 
    is_isosceles(a::Real, b::Real, c::Real) 
Returns `true` if `a`,`b`,`c` are the sides of an isosceles triangle; i.e. they are positive, exactly two are equal, and the longest one is shorter than the sum of the other two.
"""
function is_isosceles(a::Real, b::Real, c::Real)
    a,b,c = sort([a,b,c])
    0 < a && c < a+b  && (a == b || b == c) 
end

"    is_isosceles(sides::Array{<:Real,1}) = is_isosceles(sides...)"
is_isosceles(sides::Array{<:Real,1}) = is_isosceles(sides...)

""" 
    is_scalene(a::Real, b::Real, c::Real) 
Returns `true` if `a`,`b`,`c` are the sides of an equilateral triangle; i.e. they are positive, no two are equal, and the longest one is shorter than the sum of the other two.
"""
function is_scalene(a::Real, b::Real, c::Real)
    a,b,c = sort([a,b,c])
    0 < a < b < c < a+b
end
"    is_scalene(sides::Array{<:Real,1}) = is_scalene(sides...)"
is_scalene(sides::Array{<:Real,1}) = is_scalene(sides...)
