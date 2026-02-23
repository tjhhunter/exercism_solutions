"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
is_leap_year(year) = year % 400 == 0 ? true : year % 100 == 0 ? false : year % 4 == 0 ? true : false


