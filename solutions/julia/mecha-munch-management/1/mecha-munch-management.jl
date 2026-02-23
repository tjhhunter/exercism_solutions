function additems!(d,l)
	for i in l
		d[i] = get!(d,i,0) + 1
	end
	return d
end
update_recipes!(d,e) = merge!(d,e)
send_to_store(d,e) = sort([e[k] => d[k] for k in keys(d)], by=first)
function update_store_inventory!(inv,cart)
	for k in keys(cart)
		inv[k] -= cart[k]
		inv[k] = max(0, inv[k])
	end
	return filter(p -> p.second == 0, inv)
end
function reorder!(outofstock, stock)
	for k in keys(outofstock)
		outofstock[k] = get!(stock,k,100)
	end
	return outofstock
end