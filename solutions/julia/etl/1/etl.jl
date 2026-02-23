function transform(input::AbstractDict)
    d = Dict()
    for (n,l) in pairs(input)
        d = merge(d, Dict(lowercase(c)=>n for c in l))
    end
    return d
end

# Comments: I wanted to do this with one double comprehension, but I couldn't
# find a way to do that.
