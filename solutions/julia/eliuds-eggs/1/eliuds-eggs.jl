function eggcount(number)
	ln = copy(number)
		answer = 0
		while ln > 0
			if isodd(ln)
				answer +=1
				ln -= 1
			end
			ln ÷= 2
		end
		return answer
end
