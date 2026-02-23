"""
    rotate(n::Integer, str::String)::String
The Caesar cipher with shift `n` applied to `str`.  
"""
rotate(n::Integer, str::String)::String = join(rotate(n,c) for c in str)

rotate(n::Integer, c::Char)::Char = rotate(n,rotate(n, c, 'a':'z'), 'A':'Z')

function rotate(n::Integer, c::Char, r::StepRange)::Char
    c in r ? Char(Int(r[1]) + (Int(c) - Int(r[1]) + n) % length(r)) : c
end

for n in 0:26
    Meta.parse(
        """
        macro R$(n)_str(str)
            rotate($(n),str)
        end
        """
    ) |> eval
end


# Notes and Questions:
# - I wonder if it would have been better style not to make all three functions
#   methods of rotate?
# - Presumably it would be more efficient not to evaluate length('a':'z') over
#   and over again, but hardcoding in the constant 26 doesn't seem exactly
#   right either. Is this a job for a macro??
# - In the end, as usual, my first intended aim is for clarity; speed and
#   memory minimization can come later, if and when it is needed.
# - I tried using quote ... end with interpolation (instead of parse),
#   but couldn't make it work.




