function square_root(n; tol = .5)
	n < 0 && throw(DomainError(n,"naughty negative"))
	f(x) = (x + (n/x))/2
	guess = 1
	new = f(1)
	while abs(new - guess) > tol
		guess = new
		new = f(guess)
	end
	return round(guess)
end