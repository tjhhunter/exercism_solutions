using Printf

const pool = BitSet(1:1000*26*26)

mutable struct Robot
    serial::Int
end

"""
    reset!(instance::Robot)

Assigns a new identity to the robot at random from among the available identities.
The old identity is not made available for use in future robots.
"""
function reset!(instance::Robot)
    codon = rand(pool)
    delete!(pool,codon)
    instance.serial = codon
end

function name(instance::Robot)
    letters,number = divrem(instance.serial,1000)
    first_letter,second_letter = divrem(letters,26).+65
    @sprintf("%c%c%03d", first_letter, second_letter, number)
end

function Robot()
    codon = rand(pool)
    delete!(pool,codon)
    Robot(codon)
end


