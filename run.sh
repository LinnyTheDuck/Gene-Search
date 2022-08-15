if [ -z "$1" ]
then
    # to use: ./run.sh contig00028.txt
    printf "How To Use This Program:
./run.sh <contig text file>
Will print all output to the console, add \"> file\" at the end to direct all standard output to a file
"
else
    # go up a directory to access all the awk programs
    #cd ..
    # will run all the awk files together
    # extracts, finds the genes, translates into peptide sequence
    awk -f extract.awk $1 | awk -f isolate_subsequences.awk | awk -f translate.awk > peptides.txt
    # extracts, converts to reverse compliment, finds the genes, translates into peptide sequence
    awk -f extract.awk $1 | awk -f reverse_compliment.awk | awk -f isolate_subsequences.awk | awk -f translate.awk >> peptides.txt
fi