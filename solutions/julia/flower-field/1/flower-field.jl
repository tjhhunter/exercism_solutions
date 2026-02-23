function annotate(arr)	
	isempty(arr) && return []
	l,w = length(arr),length(arr[1])
	ar = [arr[row][col] for row in 1:l, col in 1:w]
	for row in 1:l
		for col in 1:w
			if ar[row, col] == ' '
				c = count(==('*'), ar[max(row-1,1):min(row+1,l), 
									  max(col-1,1):min(col+1,w)])
				c > 0 && (ar[row,col] = only(string(c)))
			end
		end
	end
	return [string(ar[row,:]...) for row in 1:l]
end