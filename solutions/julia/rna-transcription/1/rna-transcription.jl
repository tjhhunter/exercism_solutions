"""
    function to_rna(dna::String, from::String="GCTA", to::String="CGAU")::String

Returns the result of replacing each character in `dna` which occurs in `from`
with the corresponding character in `to`.

Throws `ExceptionError` if there are any characters in `dna` not in `from`.
"""
function to_rna(dna::String, from::String="GCTA", to::String="CGAU")::String
    if occursin(Regex("[^$from]"),dna) 
        throw(ErrorException("All characters in $dna should be in $from."))
    end
    join(
        replace(
            collect(dna),
            Dict(from[i]=>to[i] for i in keys(from))...
        )
    )
end

