fileTreeObject = {
    '/' => {"size" => 0}
}
lineCounter = 0
prior_folder = nil
dirToMoveTo = ""
workingDirectory = ["/"]
total = 0
File.readlines('input.txt').each{|line|
    if line[0] == "$"
        if line.include? "cd"
            commandArray = line.split(" ")
            dirToMoveTo = commandArray[2]
            
            if dirToMoveTo == ".." 
                workingDirectory.pop()
            elsif dirToMoveTo != ".." 
                workingDirectory.append(dirToMoveTo)
                fullPath = workingDirectory.join("/")
                fileTreeObject[fullPath] = {}
                fileTreeObject[fullPath]["size"] = 0
            end
        end
    else
        fileInfo = line.strip.split(" ")
        fileSize = fileInfo[0].to_i
        tmp = []
        workingDirectory.each{|directory|
            tmp.push(directory)
            tmp2 = tmp.join("/")
            fileTreeObject[tmp2]["size"] += fileSize
        }
    end
} 

#puts fileTreeObject

totalMem = 70000000
neededMem = 40000000
currentlyUsed = fileTreeObject["/"]["size"]
memToSave = currentlyUsed - neededMem
puts memToSave

totalArray = []
fileTreeObject.each{|line|
    totalArray.append(line[1]["size"])
    if line[1]["size"] < 100000
        total += line[1]["size"]
    end
}

sortedArray = totalArray.sort
sortedArray.each{|total|
    puts total
    if total > memToSave
        return total
    end
}


