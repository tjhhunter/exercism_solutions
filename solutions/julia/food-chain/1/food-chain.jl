function recite(start_verse, end_verse)
	answer = verse(start_verse)
	for i in start_verse + 1 : end_verse
		push!(answer, "", verse(i)...)
	end
	return answer
end

function verse(k)
	if k == 8
		return [iknow(8), comments[8]]
	elseif k >= 2
		return [iknow(k), 
				comments[k], 
				(predation(n) for n in k:-1:2)..., comments[1]]
	elseif k == 1
		return [iknow(1), comments[1]]
	end
end

function predation(n)
	if n==3
		"She swallowed the $(animals[n]) to catch the $(animals[n-1]) " *
			replace(comments[n-1], "It" => "that")
	else
		"She swallowed the $(animals[n]) to catch the $(animals[n-1])."
	end
end

iknow(n) = "I know an old lady who swallowed a $(animals[n])."

comments = ("I don't know why she swallowed the fly. Perhaps she'll die.",
			"It wriggled and jiggled and tickled inside her.",
			"How absurd to swallow a bird!",
			"Imagine that, to swallow a cat!",
			"What a hog, to swallow a dog!",
			"Just opened her throat and swallowed a goat!",
			"I don't know how she swallowed a cow!",
			"She's dead, of course!"
			)

animals = ("fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse")