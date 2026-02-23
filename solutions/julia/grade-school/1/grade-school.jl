Student = @NamedTuple{name::String, grade::Int64}
name(stud) = stud.name
grade(stud) = stud.grade

School = Vector{Student}

new_school() = School()

function add!(students, school)
	ans = zeros(Bool, length(students))
	for i in 1:length(students)
		if name(students[i]) ∉ [name(student) for student in school] 
			push!(school, students[i])
			ans[i] = true
		end
	end
	return ans
end

grade(num, school) = sort([name(s) for s in school if grade(s) == num])

roster(school) = name.(sort(school, by=p -> (grade(p), name(p))))