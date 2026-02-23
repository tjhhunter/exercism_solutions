const PLANTS = Dict(['G' => "grass", 
                     'C' => "clover", 
                     'R' => "radishes", 
                     'V' => "violets"])

function plants(diagram, student)
	n = student[1] - 'A'
	rows = split(diagram, "\n")
	[PLANTS[code] for code in vcat(collect(rows[1][2n+1:2n+2]), 
								   collect(rows[2][2n+1:2n+2]))]
end