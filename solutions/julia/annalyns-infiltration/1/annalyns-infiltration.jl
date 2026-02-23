can_do_fast_attack(knight_awake) = !knight_awake
can_spy(ka, aa, pa) = ka || aa || pa
can_signal_prisoner(aa, pa) = pa && !aa
function can_free_prisoner(ka, aa, pa, dp)
	if dp
		return !aa
	else
		return pa && (!ka && !aa)
	end
end