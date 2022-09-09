# COMPX555-A1

## Gene Search

This project extracts potential genes from a contig and translate them to corresponding protein sequences. The reverse complement of the contig is also computed in order to look for more potential genes/proteins.

Then BLAST will be used to analyze these sequences to see if any of them are actual genes, and to also (hopefully) figure out which organism the contigs likely come from. 

### To Run

Give bash script executeable permissions: `chmod 755 run.sh`

To run: `.\run.sh <contig file name> <option>`

```
By default a file with each gene and corresponding protien sequence will be produced.

Options:
-l      also generate peptides of length 15 or longer for BLAST lookup
-i      also keep intermediate files  
```

### AWK Scripts

1. `extract.awk` extracts all the genes from a fasta file onto a single line
2. `isolate_subsequences.awk` isolates and extracts subsequences that could hold potential genes
3. `reverse_compliment.awk` produces the reverse compliment of a sequence of dna
4. `translate.awk` translates dna into it's corresponding protien sequence
5. `size_filter.awk` filters potential protien sequences that are 15 characters or longer

### Result Files

1. `final_results.txt` contains the final 15 strongest protien candidates found
2. `corresponding_genes_peptides.txt` contains all putative genes found in the `contig2.fa` file, and their corresponding translations, listed from longest to shortest
3. `peptides_for_lookup.txt` contains all the peptides of length 15 or longer for BLAST lookup

### Members of Blue Team
Stefenie Pickston 1506427

Grady McCallum 1545313

Cat Turnbull 
