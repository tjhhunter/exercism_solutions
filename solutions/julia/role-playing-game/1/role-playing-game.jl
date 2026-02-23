StringOrMissing = Union{String, Missing}
IntOrNothing = Union{Int64,Nothing}

@kwdef mutable struct Player
	name::StringOrMissing = missing
	level::Int64 = 0
	health::Int64 = 100
	mana::IntOrNothing = nothing
end

introduce(p) = ismissing(p.name) ? "Mighty Magician" : p.name
	
function increment(som::StringOrMissing) 
    return ismissing(som) ? "The Great" : som * " the Great"
end

increment(ion::IntOrNothing) = isnothing(ion) ? 50 : ion+100

function title!(p)
	if p.level >= 42
		p.name = increment(p.name)
	end
	return p.name
end

function revive!(p)
	if p.health <= 0
		p.health = 100
		p.mana = increment(p.mana)
	end
	return p
end