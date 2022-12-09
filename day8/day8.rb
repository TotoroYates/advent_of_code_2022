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
    # return two items beside
    puts "========="
    puts "checking if this coordinate is vsisble from side: \n"
    puts "row is " + rowPosition.to_s
    puts "column is " + columnPosition.to_s

    #leftSide = forestArray[columnPosition][rowPosition - 1]
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
    puts "tree being checked is: " + treeBeingChecked.to_s
    # puts "all items to left is "
    # puts leftSideSlice
    # puts "highest element in left is " + leftSideHighest.to_s
    # puts "all items to right is "
    # puts rightSideSlice
    # puts "highest element in right is " + rightSideHighest.to_s
    # puts "verticalArray is "
    # puts verticalArray
    # puts "===="
    puts "all items to above is "
    puts upperSlice
    puts "all items to below is "
    puts lowerSlice

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

row = 0
forestArray.each{|forestRow|
    column =0
    forestRow.each{|tree|
        
        isVisible = isVisible(row, column, forestArray)
        if isVisible == true
            totalVisible += 1
        end
        column += 1
    }
    row +=1 
}

puts totalVisible