function acronym(phrase)
    phrase = replace(phrase, "'" => "")
    uppercase(join(first(w) for w in
                      split(phrase, r"\s|\p{P}", keepempty=false)
                      ))
end
