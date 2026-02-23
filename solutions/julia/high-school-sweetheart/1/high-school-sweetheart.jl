cleanupname(str) = strip(replace(str, "-" => " "))
firstletter(str) = string(cleanupname(str)[1])
initial(str) = uppercase(firstletter(str))*"."
couple(str1, str2) = "\u2764 "* initial(str1) * "  +  " * initial(str2) * " \u2764"
