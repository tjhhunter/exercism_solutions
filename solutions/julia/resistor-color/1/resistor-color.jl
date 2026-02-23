const color_list = ["black", "brown", "red", "orange", "yellow", "green", "blue","violet", "grey", "white"]
colorcode(color) = findfirst(==(color), color_list) - 1
colors() = color_list