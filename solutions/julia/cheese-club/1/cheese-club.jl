all_15(l) = all(x -> x==1 || x==5, l)
emphatics(d) = filter(p -> all_15(p[2]), d)
tobinary(l) = map(x -> x==1 ? 0 : 1,l)
tobinarymatrix(l) = hcat(map(tobinary,l)...)'