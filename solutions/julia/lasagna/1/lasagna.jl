const expected_bake_time = 60
preparation_time(nlayers) = 2*nlayers
remaining_time(time_so_far) = expected_bake_time - time_so_far
function total_working_time(nlayers, time_so_far) 
	return preparation_time(nlayers) + time_so_far
end