"""
    ispangram(input::String)::Bool

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input::String)::Bool
    'a':'z' ⊆ lowercase(input)
end

