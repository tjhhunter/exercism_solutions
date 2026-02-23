"""
    function score(x::Real, y::Real)::Integer
Darts score for a hit at position (`x`,`y`): 10 in the outer circle, 5 in 
the middle circle, and 10 in the center.
"""

function score(x::Real, y::Real)::Integer
    d = sqrt(x^2 + y^2)
    if     d > 10 return 0
    elseif d > 5  return 1
    elseif d > 1  return 5
    else          return 10
    end
end
