# Implement number base conversion

"""
    all_your_base(digits::Array,
                  base_in::Integer,
                  base_out::Integer)::Array{Integer,1}
The digits from most significant to unit digit of the `base_out` representation
of a number with `base_in` representation `digits`.  The empty list is allowed
as an input, but `[0]` is given as the representation of `[]`.  (See comments 
appended to the code for more on this)
"""
function all_your_base(digits::Array,
                       base_in::Integer,
                       base_out::Integer)::Array{Integer,1}
    todigits(fromdigits(digits,base_in),base_out)
end

function todigits(n::Integer, base::Integer)::Array{Integer,1}
    if base ≤ 1
        DomainError(base, "Base should be an integer bigger than 1.") |> throw
    end
    n == 0 && return([0])
    ans = []
    while n > 0
        n,r = divrem(n,base)
        pushfirst!(ans,r)
    end
    return ans
end

function fromdigits(digits::Array, base::Integer)::Integer
    if base ≤ 1
        DomainError(base, "Base should be an integer bigger than 1.") |> throw
    end
    if !all( 0 ≤ d < base for d in digits)
        DomainError(digits, "Each digit d should satisfy 0 ≤ d < base") |> throw
    end
    n = length(digits)
    n==0 && return 0
    sum(d*base^(n-i) for (i,d) in enumerate(digits))
end

# Comments:
#
# If digits is very long, we can, of course have overflow.
# I suppose that the thing to do if overflow is an issue is to compare
# b*length(digits) to typemax(Int64) |> log and either raise an error or
# hand off to a method that uses big() if the first is big compared to the
# second.  We will for now assume that overflow is not an issue.
#
# We have used iteration rather than recursion here.  I wonder if Julia
# is smart enough that the two strategies are equivalent.  I guess
# the possibility that it is not says that whenever the code is equally
# clean, we should go with iteration.  Any wise reader of this comment who
# has knowledge or an opinion should post a public comment sharing their
# wisdom.
#
# Finally, I am not happy with the test suite:  If we allow [0] as the digits
# of 0, then we should also allow [0,0] and [0,0,0] etc.  It would be cleaner
# to only allow [].  It seems to me incorrect to allow [0] and not the others.
