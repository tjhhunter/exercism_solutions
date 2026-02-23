function keep(values, predicate)
    [ i for i in values if predicate(i)]
end

function discard(values, predicate)
    [i for i in values if !predicate(i)]
end
