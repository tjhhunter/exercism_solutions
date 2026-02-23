"""
    isisogram(s::String)::Bool
Is `s` an isogram?
"""
isisogram(s::String)::Bool = !occursin(r"([a-z]).*\1", lowercase(s))

