function translate(phrase)
	join(translate_word.(split(phrase)), " ")
end

function translate_word(word)
	regexps = [r"^([aeiou].*|xr.*|yt.*)()$", # rule 1
			   r"^([^aeiou]*qu)(.*)$",       # rule 3
			   r"^(y?[^aeiouy]*)(.*)$",      # rule 2 or 4
			  ]
	for re in regexps
		m = match(re, word)
		isnothing(m) || return m[2]*m[1]*"ay"
	end
end