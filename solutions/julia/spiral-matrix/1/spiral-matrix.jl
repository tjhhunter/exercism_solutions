spiral_matrix(n) = n < 3 ? outer(n) : outer(n) + inner(n)

function inner(n)
    inside = (2n + 2(n-2)) .+ spiral_matrix(n-2)
    [zeros(Integer,1,n);
     zeros(Integer,n-2)  inside zeros(Integer,n-2);
     zeros(Integer,1,n)]
end

function outer(n)
    if n==0 return Array{Integer,2}(undef,0,0) end
    ans = zeros(Integer,n,n)
    ans[:,1] = 4n-3 : -1 : 3n-2
    ans[1, :] = 1:n
    ans[:, end] = n:2n-1
    ans[end, :] = 3n - 2 : -1 : 2n - 1
    ans
end

