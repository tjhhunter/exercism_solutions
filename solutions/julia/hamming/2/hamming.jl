"""
    function distance(a::String, b::String, nukes::String="AGTC")::Integer

The Hamming distance between `a` and `b`. I.e. the number of locations where
the two strings differ.  If the lengths are not equal or if there are any
characters other than the nucleotides contained in `nukes` a `DomainError`
is raised.
"""
function distance(a::String, b::String, nukes::String="AGTC")::Integer
    length(a) ≠ length(b) && throw(ArgumentError(
        "$a and $b are supposed to have equal length."))
    occursin(Regex("[^$nukes]"), a*b) && throw(DomainError(
        (a,b), "$a and $b are supposed to be nucleotide sequences."))
    return sum(map(!=,a,b))
end
# Comments:  I had return sum(map(x -> x[1]==x[2] ? 0 : 1, zip(a,b))) originally
# but then I looked at abernasty's solution in the Community.  So I used that to
# simplify things
