const orbit_dict = Dict("Neptune" => 164.79132, "Mercury" => 0.2408467, 
						"Earth" => 1.0, "Saturn" => 29.447498, 
						"Jupiter" => 11.862615, "Venus" => 0.61519726, 
						"Uranus" => 84.016846, "Mars" => 1.8808158)
const earth_year_seconds = 31557600
onEarth(seconds) = seconds/earth_year_seconds


onMercury(seconds) = onEarth(seconds)/orbit_dict["Mercury"]
onVenus(seconds) = onEarth(seconds)/orbit_dict["Venus"]
onMars(seconds) = onEarth(seconds)/orbit_dict["Mars"]
onJupiter(seconds) = onEarth(seconds)/orbit_dict["Jupiter"]
onSaturn(seconds) = onEarth(seconds)/orbit_dict["Saturn"]
onUranus(seconds) = onEarth(seconds)/orbit_dict["Uranus"]
onNeptune(seconds) = onEarth(seconds)/orbit_dict["Neptune"]