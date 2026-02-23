"""
    function encode(s::String)::String
The run-length encoding of `s`.
"""
function encode(s::String)::String
    s == "" && return "" 
    join(length(x) == 1 ? x : string(length(x), x[1])
         for x in split(s, r"(?=(.))(?<!\1)"))
end

"""
    function decode(s::String)::String
The run-length decoding of `s`.
"""
function decode(s::String)::String
    s == "" && return "" 
    join(length(x) == 1 ? x : repeat(x[end], parse(Int,x[1:end-1]))
         for x in split(s, r"(?<=\D)"))
end

# Comments:
#
# `encode(s)` first splits the `s` into "words" ie maximal runs of the same
# letter.  Then it takes each word and encodes it, then joins the encodings.
# The regexp matches a zero length string looking ahead to a character and back # to a different character.
#
# `decode(s)` first splits `s` into "words" ie single characters, or an integer
# followed by a character.  Then it takes each word and decodes it, then joins
# the decodings.  The regexp matches an empty string looking back to a
# single non-digit.
