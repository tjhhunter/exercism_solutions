const jtimes = Dict("Pure Strawberry Joy" => 0.5, 
                    "Energizer" => 1.5,
					"Green Garden" => 1.5, 
					"Tropical Island" => 3, 
					"All or Nothing" => 5 )
const lwedges = Dict("small" => 6,
                     "medium" => 8,
                     "large" => 10)
time_to_mix_juice(str) = get!(jtimes, str, 2.5)
function limes_to_cut(wedges, lime_list)
	answer = 0
	while wedges > 0 && !isempty(lime_list)
		answer += 1
		wedges -= lwedges[popfirst!(lime_list)]
	end
	return answer
end
order_times(order_q) = [time_to_mix_juice(item) for item in order_q]
function remaining_orders(minutes_left, juices_to_make)
	mins, js = copy(minutes_left), copy(juices_to_make)
	while mins > 0 && !isempty(js)
		mins -= time_to_mix_juice(popfirst!(js))
	end
	return js
end