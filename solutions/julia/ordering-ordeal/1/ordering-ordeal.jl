function sortquantity!(qty)
	p = sortperm(qty, rev=true)
	sort!(qty, rev=true)
	return p
end
sortcustomer(cust, srtperm) = cust[srtperm]
function production_schedule!(cust, qty)
	p = sortquantity!(qty)
	return sortcustomer(cust, p), invperm(p)
end