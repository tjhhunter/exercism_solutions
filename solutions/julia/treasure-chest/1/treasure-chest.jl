@kwdef struct TreasureChest{T}
	password :: String
	treasure :: T
end

get_treasure(str, tc) = (str == tc.password ? tc.treasure : nothing)

multiply_treasure(n,tc) = TreasureChest(password = tc.password, 
										treasure = fill(tc.treasure,n))