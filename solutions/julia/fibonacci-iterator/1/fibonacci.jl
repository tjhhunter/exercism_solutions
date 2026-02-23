struct Fiberator
	n :: Int 
end

Base.iterate(f::Fiberator) = (1, (0, 1, f.n-1))
function Base.iterate(f::Fiberator, state)
	prev, current, count = state
	if count > 0
		new = prev + current
		return (new, (current, new, count-1))
	else
		return nothing
	end
end
Base.length(f::Fiberator) = f.n
Base.eltype(::Type{Fiberator}) = Int