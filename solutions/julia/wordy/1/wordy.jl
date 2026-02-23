const OPS = Dict("plus" => +, 
                 "multiplied by" => *, 
                 "minus" => -, 
                 "divided by" => ÷)

function wordy(problem)
	m = match(r"^(.*) (is|plus|multiplied by|minus|divided by) (-?\d+)\??$", problem)
	isnothing(m) && throw(ArgumentError("unrecognized language"))
	num = parse(Int, m[3])
	if m[2] == "is"
		return num
	else
		return OPS[m[2]](wordy(m[1]), num)
	end
end