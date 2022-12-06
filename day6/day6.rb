inputString = ""

# RECURSIONNNNNNN (the bad way)
def findUniqueSetPart1InString(input, startingPoint)
    toCompare = ""
    toCompare = input[startingPoint, 4]
    if toCompare[0] != toCompare[1] && toCompare[0] != toCompare[2] && toCompare[0] != toCompare[3] && toCompare[1] != toCompare[2] && toCompare[1] != toCompare[3] && toCompare[2] != toCompare[3]
        puts "hit!"
        puts toCompare
        return toCompare
    end
    startingPoint += 1
    findUniqueSetPart1InString(input, startingPoint)
end

# recursion a lsightly better way
def findUniqueSetInString(input, startingPoint)
    toCompare = input[startingPoint, 14]
    # NASTY
    if ("a".."z").all?{|c| toCompare.count(c) <= 1}
        return toCompare
    end
    startingPoint += 1
    findUniqueSetInString(input, startingPoint)
end

File.readlines('input.txt').each{|line|
    inputString = line
} 

## PART 1
uniqueSet = findUniqueSetPart1InString(inputString, 0)
puts uniqueSet


puts inputString.index(uniqueSet[0, 3])


## Part 2
uniqueSet = findUniqueSetInString(inputString, 0)
puts uniqueSet

puts inputString.index("zfbclsqgdmhrnj")