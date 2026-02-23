struct ComplexNumber <: Number
    real::Real
    imag::Real
end
import Base.:+, Base.:-, Base.:*, Base.inv, Base.conj, Base.:/, Base.abs, Base.exp, Base.==, Base.:≈
    
==(z::ComplexNumber, w::ComplexNumber) = (z.real == w.real) && (z.imag == w.imag)
≈(z::ComplexNumber, w::ComplexNumber) = (z.real ≈ w.real) && (z.imag ≈ w.imag)
real(z::ComplexNumber) = z.real
imag(z::ComplexNumber) = z.imag
+(z::ComplexNumber, w::ComplexNumber) = ComplexNumber(z.real + w.real, z.imag + w.imag)
+(r::Real, w::ComplexNumber) = ComplexNumber(r + w.real, w.imag)
-(z::ComplexNumber, w::ComplexNumber) = ComplexNumber(z.real - w.real, z.imag - w.imag)
*(z::ComplexNumber, w::ComplexNumber) = ComplexNumber(z.real*w.real - z.imag*w.imag,
                                                      z.real*w.imag + z.imag*w.real)
*(r::Real,z::ComplexNumber) = ComplexNumber(r*z.real, r*z.imag)
modsquare(z::ComplexNumber) = z.real^2 + z.imag^2
abs(z::ComplexNumber) = sqrt(modsquare(z))
conj(z::ComplexNumber) = ComplexNumber(z.real,-z.imag)
inv(z::ComplexNumber) = (1/modsquare(z))*conj(z)
/(z::ComplexNumber, w::ComplexNumber)  = z*inv(w)
exp(z::ComplexNumber) = exp(z.real)*ComplexNumber(cospi(z.imag/π),sinpi(z.imag/π))
jm = ComplexNumber(0,1)

