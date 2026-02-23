today(bpd) = bpd[end]
function increment_todays_count(bpd)
    bpd[end] += 1
    return bpd
end
has_day_without_birds(bpd) = (0 ∈ bpd)
count_for_first_days(bpd, n) = sum(bpd[1:n])
busy_days(bpd) = count(>=(5), bpd)
average_per_day(w1, w2) = (w1 .+ w2) ./ 2.0