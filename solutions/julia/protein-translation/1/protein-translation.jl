begin
	const codon_str = """AUG	Methionine
	UUU, UUC	Phenylalanine
	UUA, UUG	Leucine
	UCU, UCC, UCA, UCG	Serine
	UAU, UAC	Tyrosine
	UGU, UGC	Cysteine
	UGG	Tryptophan
	UAA, UAG, UGA	STOP"""
	function make_codon_dict(str)
		d = Dict{String}{String}()
		for line in split(str, "\n")
			llist = strip.(string.(split(line)),',')
			merge!(d, Dict([c => llist[end] for c in llist[1:end-1]]))
		end
		return d
	end
	const codon_dict = make_codon_dict(codon_str)
	function proteins(strand)
		ans = []
		l = length(strand)
		for i in 1:3:length(strand)
			i+2 <= l  || throw(DomainError(strand, "strand isn't a list of three character codons"))
			codon = strand[i:i+2]
			codon ∈ keys(codon_dict) || throw(DomainError(codon, "not in our list"))
			acid = codon_dict[strand[i:i+2]]
			if acid == "STOP"
				return ans
			else
				push!(ans, acid)
			end
		end
		return ans
	end
end