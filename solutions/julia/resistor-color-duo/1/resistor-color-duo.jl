const color_dict = Dict(zip(["black", "brown", "red", 
							 "orange", "yellow", "green", 
							 "blue","violet", "grey", "white"],0:9))

colorcode(colors) = 10*color_dict[colors[1]] + color_dict[colors[2]]