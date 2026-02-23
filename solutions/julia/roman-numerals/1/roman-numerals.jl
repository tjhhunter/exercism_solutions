const ones = Dict(0=>"",
	          1=>"I",  2=>"II", 3=>"III", 4=>"IV", 5=>"V",6=>"VI",7=>"VII",8=>"VIII",9=>"IX")

const A = ["I" "V" "X";
           "X" "L" "C";
           "C" "D" "M";
           "M" "🐭" "🐱"]

function to_roman(number)
    number <= 0 && throw(ErrorException("$number is not a positive integer"))
    ans = ""
    for (c,d) in enumerate(digits(number))
        ans = replace(replace(replace(ones[d],"X"=>A[c,3]),"V"=>A[c,2]),"I"=>A[c,1]) * ans
    end
    ans
end


