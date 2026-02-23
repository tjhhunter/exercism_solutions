import Base: abs, /, sign, *, inv, ^, ==, zero, one, +, -, <=, >=, <, >, convert, promote_rule, show
using Printf

struct RationalNumber{T<:Number} <: Real
    num::T
    den::T
    function RationalNumber{T}(a,b) where {T<:Number}
        a == b == 0 && throw(ArgumentError("piffle"))
        b < 0     && return new(-a,-b)
        new(a,b)
    end
end

convert(::Type{RationalNumber{T}}, n::T) where {T<:Number} =
    RationalNumber{T}(n,one(T))
promote_rule(::Type{RationalNumber{T}}, ::Type{T}) where {T<:Number} =
    RationalNumber{T}

RationalNumber(a::T,b::T) where {T<:Number} = RationalNumber{T}(a,b)
RationalNumber{T}(a::T) where {T<:Number} = RationalNumber{T}(a,one(T))
RationalNumber(a::T) where {T<:Number} = RationalNumber{T}(a)
num(q::RationalNumber) = q.num
den(q::RationalNumber) = q.den


function ==(p::RationalNumber, q::RationalNumber)
    den(p) == den(q) == 0 && return sign(num(p)) == sign(num(q))
    iszero(den(q)*num(p) - den(p)*num(q))
end

function <=(p::RationalNumber, q::RationalNumber)
    den(p) == den(q) == 0 && return sign(num(p)) <= sign(num(q))
    den(q)*num(p) <= den(p)*num(q)
end

function <(p::RationalNumber, q::RationalNumber)
    den(p) == den(q) == 0 && return sign(num(p)) < sign(num(q))
    den(q)*num(p) < den(p)*num(q)
end


+(p::RationalNumber, q::RationalNumber) = RationalNumber(num(p)*den(q) + num(q)*den(p),
                                                         den(p)*den(q))
-(p::RationalNumber, q::RationalNumber) = RationalNumber(num(p)*den(q) - num(q)*den(p),
                                                         den(p)*den(q))
numerator(q::RationalNumber) = sign(den(q))*num(q)÷(gcd(num(q),den(q)))
denominator(q::RationalNumber) = sign(den(q))*den(q)÷(gcd(num(q),den(q)))

*(p::RationalNumber, q::RationalNumber) = RationalNumber(num(p)*num(q), den(p)*den(q))
abs(q::RationalNumber) = RationalNumber(abs(num(q)),abs(den(q)))
/(q::RationalNumber, p::RationalNumber) = q * inv(p)
inv(p::RationalNumber) = RationalNumber(den(p),num(p))
^(q::RationalNumber, n::Integer) = n >= 0 ? RationalNumber(num(q)^n,den(q)^n) : inv(q^(-n))

^(x::Real,q::RationalNumber) = x^(num(q)/den(q))

show(io::IO, q::RationalNumber) = @printf(io, "%d//%d", numerator(q), denominator(q))






