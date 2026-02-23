function secret_handshake(code::Integer)
    ans = String[]
    for s in ["wink", "double blink", "close your eyes", "jump"]
        isodd(code) && push!(ans,s)
        code >>= 1
    end
    isodd(code) && reverse!(ans)
    return ans
end
