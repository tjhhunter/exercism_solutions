const TEST_GRAPHEMES = true

using Unicode

myreverse(s) = join(reverse(collect(graphemes(s))))

# note that this is cheating.  On the other hand copying the code from `@less reverse("string")` is
# also cheating.  So I don't know what to do for this exercise.


