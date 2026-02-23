function binarysearch(haystack, needle; rev=false, lt = <, by = identity )
    innerlt(a,b) = rev ? !lt(a,b) : lt(a,b)
    left, right = 1, length(haystack)
    while left <= right
        middle = (right + left) ÷ 2
        straw = by(haystack[middle])
        if needle == straw
            return middle:middle
        elseif innerlt(straw, needle)
            left = middle + 1
        else
            right = middle - 1
        end
    end
    return left:right
end

