function gameoflife(matrix)
	m = copy(matrix)
	nrows, ncols = size(m)
	for row in 1:nrows, col in 1:ncols
		nnbrs = sum(matrix[max(row-1,1):min(row+1, nrows), 
						   max(col-1,1):min(col+1,ncols)]) - matrix[row,col]
		if matrix[row,col] == 0 && nnbrs == 3
			m[row,col] = 1
		elseif matrix[row,col] == 1 && !(2 ≤ nnbrs ≤ 3)
			m[row,col] = 0
		end
	end
	return m
end