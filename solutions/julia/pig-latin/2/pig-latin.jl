function translate(phrase)
	join(translate_word.(split(phrase)), " ")
end

function translate_word(word)
	occursin(r"^([aeiou]|xr|yt)", word) && return word*"ay" # rule 1
	other_regexps = [r"^([^aeiou]*qu)(.*)",	 # rule 3
					 r"^(y[^aeiouy]*)(.*)$", # rule 2 or 4 starting in y
                     r"^([^aeiouy]+)(.*)$"]  # rule 2 or 4 starting in nony
	for re in other_regexps
		m = match(re, word)
		isnothing(m) || return m[2]*m[1]*"ay"
	end
end