# Brute force, but fast enough for the test suite.
pythagorean_triplets(N::Integer) =
    [(a,b,N-a-b)
     for a in 1:fld(N,3)
     for b in a+1:cld(N-a,2)-1
     if a^2 + b^2 == (N-a-b)^2]

