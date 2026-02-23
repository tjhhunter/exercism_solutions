# n=big(
"""
    isarmstrong(n::Integer)

Returns `true` if n is the sum of the `l`-th powers of its digits base 10, 
where `l` is the number of digits.  

The use of `big()` is not needed to pass the exercism test suite, but
something is needed if one wats to get to the end of the list of
Armstrong numbers in the online encyclopedia of integer sequences.
There, 115132219018763992565095597973971522401 is listed as the 88th
Armstrong number. I'm not sure if this is the best way to deal with
large examples. Please leave comments or advice in the comments at the
community solutions.
"""
function isarmstrong(n::Integer)
    ds = digits(n)
    l = length(ds);
    n == sum(big(x)^l for x in ds)
end
