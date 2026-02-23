function wordcount(sentence)
    d = Dict()
    for w in split(sentence, r"[\s,]+")
        ww = lowercase(replace(w, r"^\W*|\W*$" => s""))
        if ww in keys(d)
            d[ww] += 1
        elseif ww != ""
            d[ww] = 1
        end
    end
    return d
end

# Comments: This code treats "it''s" or "it?s" as (different) words to be
# counted. I am not sure that that is what wanted, but it seems reasonable, and
# it also counts "hand-picked" as a word, which seems right.
# It counts "whoops--darn" as one word as well which maybe is not right.
# In any case it is seems short and clear and it passes all the tests, so I
# will leave it this way until a higher power says they need something better.


