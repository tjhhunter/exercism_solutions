function clean(phone_number)
    if replace(phone_number, r"\d|[.+()-]|\s" => s"") !== "" # invalid if there is scunge
        return nothing
    end
    ans = replace(replace(phone_number, r"\D" => s""), r"^1" =>  s"")
    if length(ans) !== 10 || in(ans[1],"01") || in(ans[4],"01") #other ways to be invalid
        return nothing
    else
        return ans
    end
end
