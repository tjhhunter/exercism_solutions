const scores = merge(Dict(c=>1  for c in "AEIOURSTLN"),
                     Dict(c=>2  for c in "DG"),
                     Dict(c=>3  for c in "BCMP"),
                     Dict(c=>4  for c in "FHVWY"),
                     Dict(c=>5  for c in "K"),
                     Dict(c=>8  for c in "JX"),
                     Dict(c=>10 for c in "QZ"),
                     Dict(c=>0  for c in " Ñ"))

function score(str)
    str == "" && return 0
    sum(scores[c] for c in uppercase(str))
end

# comments: Adding double letter scores, triple word scores, etc would
# require figuring out how to indicate those.  There is a standard notation
# described on the wikipedia page for scrabble, but fully implementing that
# would require including the possibility of merging onto existing words
# as well. I'll leave that for a future day.
