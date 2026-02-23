struct Coord
	x::UInt16
	y::UInt16
end

@kwdef struct Plot
	bottom_left::Coord
	top_right::Coord
end

is_claim_staked(claim, register) = claim ∈ register

function stake_claim!(claim, register)
	if is_claim_staked(claim,register)
		return false
	else 
		push!(register, claim)
		return true
	end
end

function get_longest_side(claim)
	l, b = sort((claim.bottom_left.x, claim.top_right.x))
	hl = b -l
	l,b = sort((claim.bottom_left.y, claim.top_right.y))
	vl = b - l
	return max(hl,vl)
end

function get_claim_with_longest_side(register)
	lst = collect(register)
	m = maximum(get_longest_side, lst)
	return Set([x for x in register if get_longest_side(x) == m])
end