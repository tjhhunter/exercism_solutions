function rows(letter)
	letters = collect('A':only(letter))
	l = length(letters)
	s = 2l-1
	mans = fill(' ', s, s)
	for i in 1:l
		mans[i,l-i+1] = mans[s - i + 1, l-i+1] = mans[i,l+i-1] = 
			mans[s-i+1,l+i-1] = letters[i]
	end
	return [String(mans[i,:]) for i in 1:s]
end