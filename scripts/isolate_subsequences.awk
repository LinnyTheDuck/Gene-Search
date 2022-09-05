# at the start overwrite 
BEGIN	{
    # printf > "subsequences.txt"
    flag = 1
}

{
    substring = $0
    # infitine loop
    while (1) {
        # if we find the start codon, get its position
        match(substring, /ATG/)
        # if it's not found break out of the loop
        if (RLENGTH == -1) {
            break
        }
        substring = substr(substring, RSTART)
        # start counting from the base after the ATG
        i = 4
        # use a sliding window of 3 to loop through and find a stop codon
        for (; i < length(substring); i += 3){
            searchString = substr(substring, i, 3)
            # if a stop codon is found, break out of the loop
            if (searchString == "TGA" || searchString == "TAA" || searchString == "TAG"){
                break
            }
        }
        # if i is within the range of the substring, print it out
        if (i < length(substring) && i != 4){
            print substr(substring, 0, i + 2) # >> "subsequences.txt"
        }
        substring = substr(substring, 3)
    }  
}
