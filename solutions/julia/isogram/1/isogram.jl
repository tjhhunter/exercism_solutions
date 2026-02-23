"""
    isisogram(s::String)::Boolean
Is `s` an isogram?
"""
isisogram(s::String)::Bool = !occursin(r"([a-z]).*\1", lowercase(s))

