"""
    function detect_anagrams(subject, candidates)
Sublist of `candidates` that has anagrams of `subject`.
Case is ignored for comparison, but preserved in the sublist.
Words are not considered to be anagrams of themselves.
"""
function detect_anagrams(subject, candidates)
    ss = sort(split(lowercase(subject), ""))
    function isana(t)
        ss == sort(split(lowercase(t), "")) &&
            lowercase(subject) != lowercase(t)
    end
    filter(isana, candidates)
end


# Comments:
# Aim was for code clarity, but not so much speed.
# I wonder if it isn't plenty fast, if the only issue of scale is the length
# of the candidate list.
