function raindrops(number)
    p3, p5, p7 = mod(number,3) == 0 , mod(number,5) == 0, mod(number,7) == 0
    !p3 && !p5 && !p7 && return string(number)
    (p3 ? "Pling" : "")*(p5 ? "Plang" : "")*(p7 ? "Plong" : "")
end
