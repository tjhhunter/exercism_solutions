using Dates,Printf
import Base: +,-,show
const MINSINADAY = 24*60

struct Clock
    value::Int
    Clock(n) = new(mod(n,MINSINADAY))
end

Clock(h,m) = Clock(60*h + m)

value(c::Clock) = c.value

minutes(c::Clock) = mod(c.value,60)
hours(c::Clock)   = div(c.value,60)

+(c::Clock, m::Minute) = Clock(value(c) + Dates.value(m))
-(c::Clock, m::Minute) = Clock(value(c) - Dates.value(m))

show(io::IO, c::Clock) = @printf(io, "\"%02d:%02d\"",hours(c),minutes(c))

