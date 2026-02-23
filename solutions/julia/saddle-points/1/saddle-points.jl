function saddlepoints(M)
	ans = Tuple{Int64,Int64}[]
	isempty(M) && return ans
	rows, cols = size(M)
	for row in 1:rows
		val = maximum(M[row,:])
		for col in 1:cols
			M[row, col] == val && 
				M[row,col] == minimum(M[:,col]) && 
					push!(ans, (row,col))
		end
	end
	return ans
end
