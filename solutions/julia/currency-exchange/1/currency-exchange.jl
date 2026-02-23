exchange_money(budget, exchange_rate) = budget / exchange_rate
get_change(budget, exchanging_value) = budget - exchanging_value
function get_value_of_bills(denomination, number_of_bills)
	return denomination * number_of_bills
end
get_number_of_bills(amount, denomination) = floor(Int, amount/denomination)
function get_leftover_of_bills(amount, denomination) 
	return amount - 
		get_value_of_bills(denomination, 
						   get_number_of_bills(amount, denomination))
end
function exchangeable_value(budget, exchange_rate, spread, denomination)
	actual_er = exchange_rate*(1.0 + spread/100.0)
	return get_value_of_bills(denomination,
		get_number_of_bills(exchange_money(budget, actual_er), 
							denomination))
end