# helper methods
## check play, check condition(input)
def checkMyPlayInput(input)
    case input
    when "X" 
        return 1
    when "Y"
        return 2
    when "Z"
        return 3
    else 
        return "unexpected input to checkMyPlayInput"
    end
end

## check condition(win/loss/tie)
def checkWinCondition(oponentInput, myInput) # (A (ROCK), B (PAPER), C (SCISSORS))  (X(Rock), Y (PAPER), Z(SCissors))
    # cast input two to match input one
    myConvertedInput2 = ""
    case myInput
    when "X"
        myConvertedInput2 = "A"
    when "Y"
        myConvertedInput2 = "B"
    when "Z"
        myConvertedInput2 = "C"
    else 
        return "unexpected input to checkWinCondition"
    end 

    if oponentInput == myConvertedInput2
        return 3
    end

    if myConvertedInput2 == "A" 
        case oponentInput
        when "B"
            return 0
        when "C"
            return 6
        else
            return "unexpected input to checkWinCondition"
        end
    end

    if myConvertedInput2 == "B" 
        case oponentInput
        when "A"
            return 6
        when "C"
            return 0
        else
            return "unexpected input to checkWinCondition"
        end
    end

    if myConvertedInput2 == "C" 
        case oponentInput
        when "A"
            return 0
        when "B"
            return 6
        else
            return "unexpected input to checkWinCondition"
        end
    end

    puts "not a tie"
end

### PART 1
read each line
total = 0
File.readlines('input.txt').each { |line|
    inputArray = line.split(" ")
    puts "score from input is: \n"
    total += checkMyPlayInput inputArray[1]
    puts "\n --- \n"
    puts "score from match was: \n"
    total += checkWinCondition inputArray[0], inputArray[1]
    puts "\n --- \n"
}

# add those to total ^
puts total

############# PART 2 ###########################

def getLossInputScore(input)
    case input
    when "A"
        return 3
    when "B"
        return 1
    when "C"
        return 2
    else
    return "unexpected input to getLossInputScore"
    end
end

def getTieInputScore(input)
    case input
    when "A"
        return 1
    when "B"
        return 2
    when "C"
        return 3
    else
    return "unexpected input to getLossInputScore"
    end
end

def getWinInputScore(input)
    case input
    when "A"
        return 2
    when "B"
        return 3
    when "C"
        return 1
    else
    return "unexpected input to getLossInputScore"
    end
end

total = 0
File.readlines('input.txt').each { |line|
    inputArray = line.split(" ")
    
    case inputArray[1]
    when "X"
        total += (0 + getLossInputScore(inputArray[0])) # this should return the point value of what I char I would play to lose
    when "Y"
        total += (3 + getTieInputScore(inputArray[0]))
    when "Z"
        total += (6 + getWinInputScore(inputArray[0]))
    else
        return "unexpected input to input array case statement"
    end
    
}
puts total