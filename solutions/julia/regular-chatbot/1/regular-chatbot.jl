is_valid_command(str) = occursin(r"^Chatbot"i, str)
remove_emoji(str) = replace(str, r"emoji\d+" => "")

function check_phone_number(str)
	re = r"^\(\+\d\d\) \d\d\d-\d\d\d-\d\d\d$"
	if occursin(re, str)
		return "Thanks! You can now download me to your phone."
	else return "Oops, it seems like I can't reach out to $(str)"
	end
end

getURL(str) = [m.match for m in eachmatch(r"\w+\.(org|com|so)" ,str)]

function nice_to_meet_you(str)
	m = match(r"(\w+), (\w+)", str)
	return "Nice to meet you, $(m[2]) $(m[1])"
end