"""
    encode(str::AbstractString)
The atbash encoding for `str` using the Latin alphabet, treating all characters as lowercase and ignoring nonletter characters.  Written out in groups of five.
"""
function encode(str::AbstractString)
    cleaned = replace(lowercase(str), r"[^a-z0-9]" => "")
    atbashed = join(encode(c) for c in cleaned)
    replace(atbashed, r"(.....)"=> s"\1 ") |> strip
end

encode(c::AbstractChar) = c in 'a':'z' ? 219 - Int(c) |> Char : c

"""
    decode(str::AbstractString)
The atbash decoding of `str`.
"""
function decode(str::AbstractString)
    cleaned = replace(lowercase(str), r"[^a-z0-9]" => "")
    join(encode(c) for c in cleaned)
end



