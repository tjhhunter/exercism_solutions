function bob(stimulus)
    isaquestion = occursin(r"\?\s*$", stimulus)
    isayell = (stimulus == uppercase(stimulus)) && occursin(r"\p{L}", stimulus)
    isallspace = occursin(r"^\s*$", stimulus)
    if isaquestion
        if isayell
            return "Calm down, I know what I'm doing!"
        else
            return "Sure."
        end
    elseif isayell
        return "Whoa, chill out!"
    elseif isallspace
        return "Fine. Be that way!"
    else
        return "Whatever."
    end 
end
