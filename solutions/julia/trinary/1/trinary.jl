function trinary_to_decimal(str)
    occursin(r"[^012]", str) && return 0
    sum(d*3^(k-1) for (k,d) in enumerate(parse(Int,c) for c in reverse(str)))
end

