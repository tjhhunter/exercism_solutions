	clean_ingredients(str,lst) = (str, Set(lst))
function check_drinks(str,lst)
	if isempty(ALCOHOLS ∩ Set(lst))
		return str * " Mocktail"
	else
		return str * " Cocktail"
	end
end
function categorize_dish(str,s)
    if s ⊆ VEGAN
        cstr =  "VEGAN"
    elseif s ⊆ VEGETARIAN
        cstr =  "VEGETARIAN"
    elseif s ⊆ PALEO
        cstr =  "PALEO"
    elseif s ⊆ KETO
        cstr =  "KETO"
    elseif s ⊆ OMNIVORE
        cstr =  "OMNIVORE"
    else cstr = "VOODOO"
    end
	return str * ": " * cstr
end
tag_special_ingredients(pr) = pr[1], Set(pr[2]) ∩ SPECIAL_INGREDIENTS
compile_ingredients(dishes) = union(dishes...)
function separate_appetizers(dlst, alst)
	udl = unique(dlst)
	return [d for d in udl if !(d ∈ alst)]
end
function singleton_ingredients(dlist, cints)
	return setdiff(compile_ingredients(dlist), cints)
end