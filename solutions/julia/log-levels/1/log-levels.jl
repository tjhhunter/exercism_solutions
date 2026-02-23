message(string) = strip(split(string, ":")[end])
log_level(string) = lowercase(split(string, ":")[1][2:end-1])
reformat(string) = message(string) * " (" * log_level(string)* ")"
