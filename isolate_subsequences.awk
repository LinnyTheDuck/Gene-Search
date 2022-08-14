# at the start overwrite 
BEGIN	{
    printf > "subsequences.txt"
    flag = 1
}

{
    substring = $0
    while (1) {
        match(substring, /ATG/)
        if (RLENGTH == -1) {
            break
        }
        substring = substr(substring, RSTART)
        i = 4
        for (; i < length(substring); i += 3){
            searchString = substr(substring, i, 3)
            if (searchString == "TGA" || searchString == "TAA" || searchString == "TAG"){
                break
            }
        }
        if (i < length(substring) && i != 4){
            print substr(substring, 0, i + 2) >> "subsequences.txt"
        }
        substring = substr(substring, i + 3)
    }  
}
