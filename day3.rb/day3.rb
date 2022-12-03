charToIntDictionary = {
    "a" => 1,
    "b" => 2,
    "c" => 3,
    "d" => 4,
    "e" => 5,
    "f" => 6,
    "g" => 7,
    "h" => 8,
    "i" => 9,
    "j" => 10,
    "k" => 11,
    "l" => 12,
    "m" => 13,
    "n" => 14,
    "o" => 15,
    "p" => 16,
    "q" => 17,
    "r" => 18,
    "s" => 19,
    "t" => 20,
    "u" => 21,
    "v" => 22,
    "w" => 23,
    "x" => 24,
    "y" => 25,
    "z" => 26,
    "A" => 27,
    "B" => 28,
    "C" => 29,
    "D" => 30,
    "E" => 31,
    "F" => 32,
    "G" => 33,
    "H" => 34,
    "I" => 35,
    "J" => 36,
    "K" => 37,
    "L" => 38,
    "M" => 39,
    "N" => 40,
    "O" => 41,
    "P" => 42,
    "Q" => 43,
    "R" => 44,
    "S" => 45,
    "T" => 46,
    "U" => 47,
    "V" => 48,
    "W" => 49,
    "X" => 50,
    "Y" => 51,
    "Z" => 52,
}

## get the common item
def GetMatchingChar(inputString1, inputString2)
    inputString1.chars.each {|char1| 
        inputString2.chars.each {|char2|
         if char1 == char2
             return char1
         end
     }
     }
    end
### PART 1
# read each line
total = 0
File.readlines('input.txt').each {|line|
    
    ## split it in half
    first, second = line.chars.each_slice(line.length / 2).map(&:join)
    # puts first
    # puts second
    ## get value of common item
    matchingChar =  GetMatchingChar(first, second)
     ## add to total
    total += charToIntDictionary[matchingChar]
}
puts total
### PART 2

## this is the worst piece of code I have ever written
def GetMatchingCharPtTwo(inputString1, inputString2, inputString3)
    inputString1.chars.each {|char1|
        inputString2.chars.each{ |char2| 
            inputString3.chars.each{ |char3| 
                if char1 == char2 && char2 == char3
                    return char1
                end
            }
        }
    }
end
### split into - three elf groups
total = 0
File.foreach("input.txt").each_slice(3) do |threelines|
    puts threelines
    puts threelines.class
    matchingCharPtTwo = GetMatchingCharPtTwo(threelines[0], threelines[1], threelines[2])
    total += charToIntDictionary[matchingCharPtTwo]
end
puts total

### find common item between each group


### get value of that item and add tot total