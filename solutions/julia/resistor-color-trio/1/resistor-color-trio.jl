label(colors) = label(colors...)

function label(a::String, b::String, c::String)
    ohms = (10*colordict[a] + colordict[b])*10^colordict[c]
    d,r = divrem(ohms,1000)
    r !=0 ? "$ohms ohms" : "$d kiloohms"
end

colorlist = ("black", "brown", "red", "orange", "yellow",
             "green", "blue", "violet", "grey", "white")
colordict = Dict(zip(colorlist,0:9))
