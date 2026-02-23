function create_inventory(lst)
	ans = Dict{String, Int}()
	for item in lst
		ans[item] = get!(ans, item, 0) + 1
	end
	return ans
end
function add_items(dict, list)
	for item in list
		dict[item] = get!(dict, item, 0) +1
	end
	return dict
end
function decrement_items(dict, list)
	for item in list
		item ∈ keys(dict) && dict[item] > 0 && (dict[item] -= 1)
	end
	return dict
end
function remove_item(dict, item)
	if item in keys(dict)
		pop!(dict, item, nothing)
	end
	return dict
end
function list_inventory(dict)
	ans = [k =>dict[k] for k in keys(dict) if dict[k]>0]
	return sort(ans, by= p -> p[1])
end