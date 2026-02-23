function matrix(strmatrix)
    lines = split.(split(strmatrix, "\n"))
    width, height = length(lines[1]), length(lines)
    matrix = [parse(Int, lines[row][col]) for row in 1:height, col in 1:width]
    rows = [matrix[row,:] for row in 1:height]
    columns = [matrix[:,col] for col in 1:width]
    rows, columns
end
