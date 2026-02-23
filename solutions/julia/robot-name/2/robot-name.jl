using Printf, Random
const pool = shuffle(1:1000*26*26)

# Alternately could use
# const pool = BitSet(1:1000*26*26)
# which uses less memory (I think) but requires rand then delete! instead of pop!

mutable struct Robot
    serial::Int
end

"""
    reset!(instance::Robot)

Assigns a new identity to the robot at random from among the available identities.
The old identity is not made available for use in future robots.
"""
reset!(instance::Robot) = instance.serial = pop!(pool)

function name(instance::Robot)
    letters,number = divrem(instance.serial,1000)
    first_letter,second_letter = divrem(letters,26).+65
    @sprintf("%c%c%03d", first_letter, second_letter, number)
end

Robot() = Robot(pop!(pool))



