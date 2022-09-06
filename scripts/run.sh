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
    awk -f extract.awk $1 | awk -f isolate_subsequences.awk > genes.txt
    # extracts, converts to reverse compliment, finds the genes, translates into peptide sequence
    awk -f extract.awk $1 | awk -f reverse_compliment.awk | awk -f isolate_subsequences.awk >> genes.txt
    # convert to peptides
    awk -f translate.awk genes.txt > peptides.txt
    # sort by size
    cat genes.txt | awk '{ print length, $0 }' | sort -n | awk '{$1=""; print $0}' > sorted_genes.txt
    cat peptides.txt | awk '{ print length, $0 }' | sort -n | awk '{$1=""; print $0}' > sorted_peptides.txt
    # reverse the files
    
    # combine the files into the order tony specified
    
    # peptide sequence that are 15 characters long or greater, for blasting
    # awk -f size_filter.awk peptides.txt > final.txt

    rm genes.txt
    rm peptides.txt
    rm sorted_genes.txt
    rm sorted_peptides.txt
fi