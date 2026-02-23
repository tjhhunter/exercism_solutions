random_planet() = rand("DHJKLMNRTY")
random_ship_registry_number() = "NCC-$(rand(1000:9999))"
random_ship_registry_number()
random_stardate() = 41000.0 + rand()*1000.0
random_stardate_v2() = round(random_stardate(), digits=1)
pick_starships(ships, n_n) = shuffle(ships)[1:n_n]