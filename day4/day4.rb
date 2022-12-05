def contains(section1, section2)
    puts "section 1 is " + section1
    puts "section 2 is " + section2
    # get start of section 1, get stop of section 1
    section1Array = section1.split("-")
    section2Array = section2.split("-")

    section1Start =  section1Array[0].to_i
    section1End = section1Array[1].to_i

    section2Start = section2Array[0].to_i
    section2End = section2Array[1].to_i

    ## Check if one is contained in two
    if section1Start >= section2Start && section1End <= section2End 
        puts "section 1 is contained in section 2"
        return 1
    end

    ## Check if two is contained in one
    if section2Start >= section1Start && section2End <= section1End
        puts "section 2 is contained in section 1"
        return 1
    end
    return 0
   
end

def intersects(section1, section2)
    puts "section 1 is " + section1
    puts "section 2 is " + section2
    # get start of section 1, get stop of section 1
    section1Array = section1.split("-")
    section2Array = section2.split("-")

    section1Start =  section1Array[0].to_i
    section1End = section1Array[1].to_i

    section2Start = section2Array[0].to_i
    section2End = section2Array[1].to_i

    ## Check if one is contained in two
    if (section2Start <= section1Start && section1Start <= section2End) || (section2Start <= section1End && section1End <= section2End)
        puts "section 1 intersects 2"
        return 1
    end

    ## Check if two is contained in one
    if (section1Start <= section2Start && section2Start <= section1End) || (section1Start <= section2End  && section2End <= section1End)
        puts "section 2 intersects 1"
        return 1
    end
    return 0
end

total = 0

## PART 1
# File.readlines('input.txt').each{|line|
#     splitSections = line.split(",")
#     total += contains(splitSections[0], splitSections[1])
    
# }


## Part2
File.readlines('input.txt').each{|line|
    splitSections = line.split(",")
    total += intersects(splitSections[0], splitSections[1])
}
puts total

