schedule_appointment(str) = DateTime(str, dateformat"m/d/y H:M:S")
has_passed(dt) = (dt <= now())
is_afternoon_appointment(dt) = (Time(12) <= Time(dt) < Time(18))

function describe(dt)
	return "You have an appointment on " * 
		Dates.format(dt, dateformat"E, U d, Y") *
		" at " * Dates.format(dt,"HH:MM")
end

anniversary_date() = Date(year(now()),9,15)
