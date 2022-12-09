# parse input into array of arrays?
lineCounter = 0
totalVisible = 0
forestArray = []
File.readlines('input.txt').each{|line|
    line = line.strip
    singleLineArray = []
    line.chars.each{|tree|
        singleLineArray.append(tree.to_i)
    }
    forestArray.append(singleLineArray)
}

def isVisibleFromSide(rowPosition, columnPosition, forestArray)
    leftSideSlice = forestArray[rowPosition].slice(0, columnPosition) 
    rightSideSlice = forestArray[rowPosition].slice(columnPosition +1, 100)

    leftSideHighest = leftSideSlice.max
    rightSideHighest = rightSideSlice.max

    columnLength = forestArray[0].length
    columnCounter = 0
    verticalArray = []
    while columnCounter < forestArray.length

        verticalArray.append(forestArray[columnCounter][columnPosition])
        columnCounter += 1
    end

    upperSlice = verticalArray.slice(0, rowPosition)
    lowerSlice = verticalArray.slice(rowPosition + 1, 100)

    upperHighest = upperSlice.max
    lowerHighest = lowerSlice.max

    treeBeingChecked = forestArray[rowPosition][columnPosition]

    if treeBeingChecked > leftSideHighest || treeBeingChecked > rightSideHighest 
        puts "row " + rowPosition.to_s + " colomn " + columnPosition.to_s + " is visble from the sides"
        return true
    end

    if treeBeingChecked > upperHighest || treeBeingChecked > lowerHighest
        puts "row " + rowPosition.to_s + " colomn " + columnPosition.to_s + " is visble from the up down"
        return true
    end

end


def isVisible(rowPosition, columnPosition, forestArray)
    rowLength = forestArray.length
    columnLength = forestArray[0].length
    ## if top or bottom, left or rightmost return true
    if rowPosition == 0 || rowPosition == rowLength - 1 || columnPosition == 0 || columnPosition == columnLength -1
        return true
    end

    return isVisibleFromSide(rowPosition, columnPosition, forestArray)

end

def getLeftScore(treeBeingChecked, leftSideSlice)
    leftSideScore = 0
    if leftSideSlice.length > 0
        leftSideSlice = leftSideSlice.reverse()
        leftSideSlice.each{|treeToCompare|
            leftSideScore += 1
            if treeToCompare >= treeBeingChecked
                return leftSideScore
            end
        }
    end
    return leftSideScore
end

def getRightScore(treeBeingChecked, rightSideSlice)
    rightSideScore = 0
    if rightSideSlice.length > 0
        rightSideSlice.each{|treeToCompare|
            rightSideScore += 1
            if treeToCompare >= treeBeingChecked
                return rightSideScore
            end
        }
    end
    return rightSideScore
end

def calculateScenicScore(rowPosition, columnPosition, forestArray)
    leftSideSlice = forestArray[rowPosition].slice(0, columnPosition) 
    rightSideSlice = forestArray[rowPosition].slice(columnPosition +1, 100)

    columnLength = forestArray[0].length
    columnCounter = 0
    verticalArray = []
    while columnCounter < forestArray.length

        verticalArray.append(forestArray[columnCounter][columnPosition])
        columnCounter += 1
    end

    upperSlice = verticalArray.slice(0, rowPosition)
    lowerSlice = verticalArray.slice(rowPosition + 1, 100)

    treeBeingChecked = forestArray[rowPosition][columnPosition]

    leftSideScore = getLeftScore(treeBeingChecked, leftSideSlice)
    rightSideScore = getRightScore(treeBeingChecked, rightSideSlice)
    upperScore = getLeftScore(treeBeingChecked, upperSlice)
    lowerScore = getRightScore(treeBeingChecked, lowerSlice)

    scenicScore = (leftSideScore * rightSideScore * upperScore * lowerScore)
    return scenicScore
end

 ## PART 1 
# row = 0
# forestArray.each{|forestRow|
#     column =0
#     forestRow.each{|tree|
        
#         isVisible = isVisible(row, column, forestArray)
#         if isVisible == true
#             totalVisible += 1
#         end
#         column += 1
#     }
#     row +=1 
# }

# puts totalVisible

## PART 2
scenicScores = []
row = 0
forestArray.each{|forestRow|
    column =0
    forestRow.each{|tree|
        
        scenicScore = calculateScenicScore(row, column, forestArray)
        scenicScores.append(scenicScore)
        column += 1
    }
    row +=1 
}

puts scenicScores.max