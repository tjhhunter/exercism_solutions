function score(dice, category)
	if category == "ones"
		return count(==(1), dice)
	elseif category == "twos"
		return 2*count(==(2), dice)
	elseif category == "threes"
		return 3*count(==(3), dice)
	elseif category == "fours"
		return 4*count(==(4), dice)
	elseif category == "fives"
		return 5*count(==(5), dice)
	elseif category == "sixes"
		return 6*count(==(6), dice)
	elseif category == "full house"
		if length(unique(dice)) == 2 && count(==(dice[1]), dice) ∈ 2:3
			return sum(dice)
		else
			return 0
		end
	elseif category == "four of a kind"
		c = count(==(dice[1]), dice)
		if length(unique(dice)) <= 2 && c ∈ [1,4,5]
			return c ∈ [4,5] ? 4*dice[1] : 4*dice[2]
		else
			return 0
		end
	elseif category == "little straight"
		return Set(dice) == Set(1:5) ? 30 : 0
	elseif category == "big straight"
		return Set(dice) == Set(2:6) ? 30 : 0
	elseif category == "choice"
		return sum(dice)
	elseif category == "yacht"
		return length(unique(dice)) == 1 ? 50 : 0
	else throw(DomainError(category, "is not in the rule book"))
	end
end