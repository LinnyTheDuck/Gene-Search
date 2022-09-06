# fail on the first error
set -e 

if [ -z "$1" ]
then
    # to use: ./run.sh contig00028.txt
    printf "Usage: ./run.sh <contig text file> <option>

By default a file with each gene and corresponding protien sequence will be produced.

Options:
-l      also generate peptides of length 15 or longer for BLAST lookup
-i      also keep intermediate files    
"

else
    # will run all the awk files together
    # extracts, finds the genes, translates into peptide sequence
    awk -f extract.awk $1 | awk -f isolate_subsequences.awk > genes.txt

    # extracts, converts to reverse compliment, finds the genes, translates into peptide sequence
    awk -f extract.awk $1 | awk -f reverse_compliment.awk | awk -f isolate_subsequences.awk >> genes.txt
    
    # convert to peptides
    awk -f translate.awk genes.txt > peptides.txt
    
    # sort by size, reversed
    cat genes.txt | awk '{ print length, $0 }' | sort -nr | awk '{$1=""; print $0}' > sorted_genes.txt
    cat peptides.txt | awk '{ print length, $0 }' | sort -nr | awk '{$1=""; print $0}' > sorted_peptides.txt
    
    # combine the files into gene, protien, newline
    awk 'BEGIN { OFS="\n"} FNR==NR { a[(FNR"")] = $0; next } { print a[(FNR"")], $0, ""}' sorted_genes.txt sorted_peptides.txt > ../results/corresponding_genes_peptides.txt
    
    if [ "$2" == '-l' ]
    then
        # peptide sequence that are 15 characters long or greater, for blasting
        awk -f size_filter.awk peptides.txt | uniq > ../results/peptides_for_lookup.txt
    elif [ "$2" == '-i' ]
    then
        # move intermediate files into results folder
        mv genes.txt peptides.txt sorted_genes.txt sorted_peptides.txt ../results
    else
        # otherwise remove
        rm genes.txt peptides.txt sorted_genes.txt sorted_peptides.txt
    fi
fi