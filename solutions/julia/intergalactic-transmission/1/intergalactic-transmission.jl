function get_transmit_sequence(message)
	my_digits = vcat((reverse∘digits).(message, base=2, pad=8)...)
	l = length(my_digits)
	more_digits = vcat(my_digits,zeros(Integer, mod(-l,7)))
	septads = [more_digits[k:k+6] for k = 1:7:l]
	map(septads) do x
		UInt8(mod(sum(x),2) + sum(x[8-i]*2^i for i in 1:7))
	end
end

function decode_sequence(received_seq)
	my_digits = Int[]
	for w in received_seq
		dw = reverse(digits(w, base=2, pad=8))
		mod(sum(dw[1:8]),2) == 0 || throw(ErrorException("$w has the wrong parity bit"))	
		my_digits = vcat(my_digits, dw[1:7])
	end
	octads = [my_digits[k:k+7] for k in 1:8:length(my_digits)-7]
	map(octads) do x
		UInt8(sum(x[8-i]*2^i for i in 0:7))
	end
end