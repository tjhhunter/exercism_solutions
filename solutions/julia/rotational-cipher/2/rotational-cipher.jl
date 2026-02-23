"""
    rotate(n::Integer, str::String)::String
The Caesar cipher with shift `n` applied to `str`.  
"""
rotate(n::Integer, str::String)::String = join(rotate(n,c) for c in str)

function rotate(n::Integer, c::Char)::Char
    for r in ('A':'Z','a':'z')
        c in r && return rotate(n,c,r) 
    end
    return c
end

function rotate(n::Integer, c::Char, r::StepRange)::Char
    Char(Int(r[1]) + (Int(c) - Int(r[1]) + n) % length(r))
end

for n in 0:26
    sym = Symbol("R",n,"_str")
    @eval begin
        macro $sym(str)
            rotate($n, str)
        end
    end
end

# Note: I am not sure that this is actually as efficient as what the mentor
# may have intended.



