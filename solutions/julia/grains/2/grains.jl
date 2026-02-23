begin
	const on64 = <<(Int128(1),63)
	const after63 = on64 - 1
	const after64 = <<(on64,1) -1
end

"""Calculate the number of grains on square `square`."""
function on_square(n::Integer)
	(n in 1:64) || throw(DomainError(n)) 
	n < 63 && return <<(1,n-1)
	return on64
end

"""Calculate the total number of grains after square `square`."""
function total_after(n::Integer)
	(n in 1:64) || throw(DomainError(n))
	n < 62 && return <<(1,n) - 1
	n == 63 && return after63
	n == 64 && return after64
end


