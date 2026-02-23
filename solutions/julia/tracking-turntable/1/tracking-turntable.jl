z(x,y) = Complex(x,y)
euler(r,θ) = r*cis(θ)
function rotate(x,y,θ) 
	c = complex(x,y)*cis(θ)
	return real(c), imag(c)
end
function rdisplace(x, y, r)
	oldr = abs(z(x,y))
	θ = angle(z(x,y))
	c = (oldr + r)*cis(θ)
	return real(c), imag(c)
end
function findsong(x,y,r,θ)
    rdisplace(rotate(x,y,θ)...,r)
end