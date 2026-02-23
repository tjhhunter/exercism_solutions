"""
    ispangram(input::AbstractString)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input::AbstractString)
    'a':'z' ⊆ lowercase(input)
end

