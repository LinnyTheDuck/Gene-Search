# at the start overwrite 
BEGIN	{
    printf > "subsequences.txt"
}

{
    match($0, /ATG([ACTG]{3})*(TAA|TGA|TAG)/)
    print substr($0, RSTART, RLENGTH) >> "subsequences.txt"
}