using Dates

function delivery_date(start, description)
	dtstart = DateTime(start)
	if description == "NOW"
	    return string(dtstart + Hour(2))
	elseif description == "ASAP"
		if Time(dtstart) < Time(13, 0, 0)
			return string(DateTime(Date(dtstart), Time(17, 0, 0)))
		else return string(DateTime(Date(dtstart) + Day(1), Time(13, 0, 0)))
		end
	elseif description == "EOW"
		if dayofweek(dtstart) ∈ Monday:Wednesday
			return string(DateTime(tonext(Date(dtstart), 5), Time(17,0,0)))
		else
			return string(DateTime(tonext(Date(dtstart), 7), Time(20,0,0)))
		end
	elseif (m = match(r"(\d+)M", description); !isnothing(m))
		n = parse(Int,m[1])
		yr = year(dtstart)
		Date(dtstart) < Date(yr,n) || (yr +=1)
		return string(tonext(DateTime(Date(yr,n), Time(8,0,0)),same=true) do x
			dayofweek(x) ∈ 1:5 
		end)
	elseif (m = match(r"Q(\d)", description); !isnothing(m))
		n = parse(Int, m[1])
		yr = year(dtstart)
		quarterofyear(dtstart) <= n || (yr+=1)
		return string(toprev(DateTime(lastdayofquarter(Date(yr,n*3)),Time(8,0,0)), 
					  same=true) do x
			dayofweek(x) ∈ 1:5
		end)
	else throw(ArgumentError("Invalid description"))
	end
end