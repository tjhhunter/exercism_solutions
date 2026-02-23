function acronym(phrase)
    phrase = replace(phrase, "'" => "")
    uppercase(string((first(w) for w in
                      split(phrase, r"\s|\p{P}", keepempty=false)
                      )...))
end
