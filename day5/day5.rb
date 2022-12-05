# create stack array
stackArrayDictionary = {
    1 => [],
    2 => [],
    3 => [],
    4 => [],
    5 => [],
    6 => [],
    7 => [],
    8 => [],
    9 => []
}

# fill stack arrays
lineNum = 0

File.readlines('input.txt').each{ |line|
    lineIterator = 1
    if lineNum < 8
        # get each line
        line.chars.each_slice(4) do |set|
            if set[1] != nil && set[1] != " "
                stackArrayDictionary[lineIterator] << set[1]
            end
            lineIterator += 1
        end
    end
    
    lineNum += 1
}

puts stackArrayDictionary
## PART 1
# File.readlines('input.txt').each{ |newLine| 
#     loops = 0

#     movedCharacter = ""
#     if newLineNum > 9
#         newLine = newLine.strip()
#         puts newLine 
#         # parse move number, from stack, to stack
#         numberToMove = newLine[/#{"move "}(.*?)#{" from"}/m, 1].to_i ## overkill but I was struggling
#         fromStack = newLine[/#{"from "}(.*?)#{" to"}/m, 1].to_i
#         toStack = newLine[-1].to_i
#         puts "------------"
#         puts numberToMove
#         puts fromStack
#         puts toStack
#         puts "---------\n"
        
#         while loops < numberToMove do
#             ## take top item from from stack
#             toAdd = stackArrayDictionary[fromStack][0]
#             puts(toAdd)
#             puts "---"
#             puts stackArrayDictionary[fromStack].shift
#             puts "xxxx"
#             puts stackArrayDictionary[fromStack]

#             # place on top of to toStack
#            stackArrayDictionary[toStack].insert(0, toAdd)
        
#             puts "doing loops"
#             loops += 1
#         end
#     end
    
#     newLineNum += 1
# }


newLineNum = 0
File.readlines('input.txt').each{ |newLine| 
    loops = 0
    if newLineNum > 9
        newLine = newLine.strip()
        puts newLine 
        # parse move number, from stack, to stack
        numberToMove = newLine[/#{"move "}(.*?)#{" from"}/m, 1].to_i ## overkill but I was struggling
        fromStack = newLine[/#{"from "}(.*?)#{" to"}/m, 1].to_i
        toStack = newLine[-1].to_i

        ## take top item from from stack
        toAddArray = Array.new()
        while loops < numberToMove do

            toAdd = stackArrayDictionary[fromStack][0]
            stackArrayDictionary[fromStack].shift
            toAddArray.append(toAdd)
            loops += 1
        end

        # take to add array and add it to new array
        properTotalArray = toAddArray.reverse()
        puts "----"
        puts properTotalArray
        properTotalArray.each{ |itemToAdd| 
            stackArrayDictionary[toStack].insert(0, itemToAdd)
        }

    end
    
    newLineNum += 1
}

puts stackArrayDictionary
