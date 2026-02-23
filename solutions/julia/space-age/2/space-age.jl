const orbit_dict = Dict("Neptune" => 164.79132, "Mercury" => 0.2408467, 
						"Earth" => 1.0, "Saturn" => 29.447498, 
						"Jupiter" => 11.862615, "Venus" => 0.61519726, 
						"Uranus" => 84.016846, "Mars" => 1.8808158)
const earth_year_seconds = 31557600

for (p,o) in orbit_dict
	eval(quote $(Symbol("on$p"))(seconds) = seconds/earth_year_seconds/$o
	end)
end