abstract type Pet end
name(p::Pet) = p.name

struct Cat  <: Pet name::String end
struct Dog  <: Pet name::String end

meets(d::Dog, e::Dog) = "sniffs"
meets(c::Cat, d:: Dog) = "hisses"
meets(d::Dog, c::Cat) = "chases"
meets(c::Cat, d::Cat) = "slinks"
meets(p::Pet, q::Pet) = "is cautious"
meets(p::Pet, x) = "runs away"
meets(x,y) = "nothing happens"

encounter(a,b) = "$(name(a)) meets $(name(b)) and $(meets(a,b))." 