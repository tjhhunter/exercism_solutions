"""
    count_nucleotides(strand::String, nukes::String="AGTC")

The frequency of each nucleotide within `strand` as a dictionary.
Nucleotides are characters in the string nukes.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand::String, nukes::String="ATCG")
    counts = Dict(zip(nukes, zeros(Integer, length(nukes))))
    for c in strand
        if c ∉ nukes throw(DomainError(c)) end
        counts[c] += 1
    end
    counts
end
