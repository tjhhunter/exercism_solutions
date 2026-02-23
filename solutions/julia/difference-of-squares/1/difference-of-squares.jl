"Square the sum of the first `n` positive integers"
square_of_sum(n) = (n*(n+1) ÷ 2)^2

"Sum the squares of the first `n` positive integers"
sum_of_squares(n) = n*(n+1)*(n+2) ÷ 3 - n*(n+1) ÷ 2

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    s = n*(n+1) ÷ 2
    s^2 - n*(n+1)*(n+2) ÷ 3 + s
end


# Explanation:
# Let S1 be the sum of the first n postive integers.
# Let S_2 be the sume of the squares of those integers.
# Summing (j+1)^2 = j^2 + 2j + 1 for j in 0:n and cancelling all but one of
# the squared terms gives (n+1)^2 = 2S1 + n+1.
# Summing (j+1)^3 = j^3 + 3j^2 + 3j + 1 for j in 0:n and cancelling all but one
# of the cubed terms gives (n+1)^3 = 3S2 + 3S1 + n+1.
# We then can calculate the formulas:
# S1 = n*(n+1)/2.  (Note that this is clearly an integer.)
# S2 = n*(n+1)(n+2)/3 - S1 (Note that this is also clearly an integer) 
#
# Notes:
# We have 
# difference(10 ^ 10) = -3894396492647365462
# difference(BigInt(10) ^ 10) = 2500000000166666666641666666665000000000
# Thus the caller must call with the right kind of integer if things get big.
# We could typecheck.
# One way to do this would be using n*(n+1)/2 = binomial(n+1,2)
# and n*(n+1)*(n+2)/3 = 2*binomial(n+2,3) and the builtin binomial.

