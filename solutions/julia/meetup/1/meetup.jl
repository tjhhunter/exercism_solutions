using Dates
const 	first, second, third, fourth, last = 1, 2, 3, 4, 5 

function meetup(year, month, week, dayofweek)
	if week == "teenth"
		return tonext(Date(year-1,12,31)) do x
		Dates.dayofweek(x) == eval(Symbol(dayofweek)) &&
		13 <= day(x) <= 19 &&
		Dates.month(x) == month
		end
	else
 	ans = tonext(Date(year-1,12,31)) do x
		Dates.dayofweek(x) == eval(Symbol(dayofweek)) &&
        dayofweekofmonth(x) == eval(Symbol(week)) &&
        Dates.month(x) == month
		end
	end
	if Dates.year(ans) == year
		return ans
	else
		return tonext(Date(year-1,12,31)) do x
		Dates.dayofweek(x) == eval(Symbol(dayofweek)) &&
        dayofweekofmonth(x) == eval(Symbol(week)) - 1 &&
        Dates.month(x) == month
		end
	end
end