const prod_mult = 221
function success_rate(als)
	if als == 0
		return 0.0
	elseif als in 1:4
		return 1.0
	elseif als in 5:8
		return 0.9
	elseif als == 9
		return 0.8
	else
		return 0.77
	end
end
production_rate_per_hour(als) = als * prod_mult * success_rate(als)
working_items_per_minute(als) = floor(Int,production_rate_per_hour(als)/60)