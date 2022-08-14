# at the start overwrite 
BEGIN	{
    printf > "subsequences.txt"
    count = 10
}

{
    while (count != 0) {
        match($0, /ATG/)
        if (RSTART == -1){
            break
        }
        substring = substr($0, RSTART, length($0) + 1 - RSTART)
        print substring > "lol.txt"

        match(substring, /(TAA|TGA|TAG)/)
        run = substr(substring, 0, RSTART + 2)
        print run > "lol2.txt"
        break
        if (RSTART == -1){
            break
        }
        count--
    }
    
}

# loop until end 
    # find ATG start now loop
        # reading frame of 3
        # until find end codon - then break out of loop