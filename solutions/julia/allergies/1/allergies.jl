const allergy_dict = Dict(
    1=>"eggs",
    2=>"peanuts",
    3=>"shellfish",
    4=>"strawberries",
    5=>"tomatoes",
    6=>"chocolate",
    7=>"pollen",
    8=>"cats"
)

function allergy_list(score) 
    digs = digits(score, base=2)
    Set(allergy_dict[j] for j in 1:min(length(digs),length(allergy_dict))
        if digs[j] == 1)
end

allergic_to(score, allergen) = allergen in allergy_list(score)



