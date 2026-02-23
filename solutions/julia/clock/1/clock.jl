using Dates
import Base: +,-,show
const MINSINADAY = 24*60

struct Clock
    value::Int
    Clock(n) = new(mod(n,MINSINADAY))
end

function Clock(h,m)
    hh,mm = divrem(m,60)
    Clock(60*mod(h + hh,24) + mm)
end

+(c::Clock, m::Minute) = Clock(c.value + m.value)

-(c::Clock, m::Minute) = Clock(c.value - m.value)

function show(io::IO, c::Clock)
    hh,mm = divrem(c.value,60)
    print(io,'"',lpad(hh,2,"0"),":",lpad(mm,2,"0"),'"')
end
