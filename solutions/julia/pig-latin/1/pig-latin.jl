function translate(phrase)
	join(translate_word.(split(phrase)), " ")
end

function translate_word(word)
	m = match(r"(y)([aeiou]+.*)", word)
		if !isnothing(m)
			return m[2]*m[1]*"ay"
		end
	m = match(r"^([^aeiou]*)(y.*)", word)
		if !isnothing(m)
			return m[2]*m[1]*"ay"
		end
	if occursin(r"^[aeiou]|xr|yt", word)
		return word*"ay"
	end
	m = match(r"^([^aeiou]*qu)(.*)",word)
	if !isnothing(m)
		return m[2]*m[1]*"ay"
	end
	m = match(r"^([^aeiou]+)(.*)$", word)
	if !isnothing(m)
		return m[2]*m[1]*"ay"
	end

end