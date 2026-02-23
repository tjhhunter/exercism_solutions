get_coordinate(pr) = pr[2]
convert_coordinate(str) = (str[1],str[2])
convert_coordinate("2A")
compare_records(pr,tp) = convert_coordinate(get_coordinate(pr)) == tp[2]
function create_record(pr,tp)
	if compare_records(pr,tp)
		return (get_coordinate(pr), tp[1], tp[3], pr[1])
	else
		return ()
	end
end