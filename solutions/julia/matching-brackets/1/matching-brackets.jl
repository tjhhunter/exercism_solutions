"""
    matching_brackets(st::String)

Return 'true' if all instances in `st' of brackets `[]`, braces `{}`, parentheses `()`,
or any combination thereof are matched and nested correctly.
"""
matching_brackets(st::String) = st == match(r"([^][)(}{]+|\[(?R)\]|\((?R)\)|{(?R)})*",st).match
# Comments:
#
# I thought there was some sort of `ismatch` function accomplishing 
# st == match(regexp, st).match. This seems to not be the case, but the
# resulting idiom doesn't seem too bad, either.
#
# In the regular expression, `[^][)(}{]` matches anything that isn't a
# bracket, brace or parenthsesis--call these "non-groupers". Also
# `(?R)` recursively indicates a substring matching the regexp.
#
# The idea of the regular expression is this:
# - A non-empty string of non-groupers is matched and nested correctly.
# - "(`foo`)", "[`foo`]", and "{`foo`}" are each matched and nested
#   correctly as long as foo is.
# - any concatenation of zero or more correctly matched and nested
#   strings is correctly matched and nested.  
#
# If one had more than three kinds of groupers, one might want to
# create the regular expression programmatically.
#
# I'm not quite sure why ?R isn't allowed each place where (?R)
# appears, but it doesn't work in any case.
