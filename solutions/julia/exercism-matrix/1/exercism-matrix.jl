const E = [
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0;
    0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
    0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0;
    0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
]
function frown!(m)
	m[7,7] = m[7,12] = m[9,9] = m[9,10] = 0
	m[7,9] = m[7,10] = m[9,7] = m[9,12] = 1
	return m
end
function frown(n)
	m = copy(n)
	m[7,7] = m[7,12] = m[9,9] = m[9,10] = 0
	m[7,9] = m[7,10] = m[9,7] = m[9,12] = 1
	return m
end
function stickerwall(m)
	n = frown(m)
	w = size(m)[2]
	ans = [m n
		   ones(Int, w)' ones(Int,w)'
		  n m]
	return ans
end
function colpixelcount(m)
	rows, cols = axes(m)
	ans = copy(m)
	for j in cols
		s = sum(m[:,j])
		for i in rows
			if m[i,j] == 1
				ans[i,j] = s
			end
		end
	end
	return ans
end
function render(m)
	rows, cols = axes(m)
	chars = fill(' ', size(m))
	for i in rows 
		for j in cols
			m[i,j] != 0 &&  (chars[i,j] = 'X')
		end
	end
	return prod([String(chars[i,:])*"\n" for i in rows])[1:end-1]
end