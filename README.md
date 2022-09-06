# COMPX555-A1

## Gene Search

This project extracts potential genes from a contig and translate them to corresponding protein sequences. The reverse complement of the contig is also computed in order to look for more potential genes/proteins.

Then BLAST will be used to analyze these sequences to see if any of them are actual genes, and to also (hopefully) figure out which organism the contigs likely come from. 

### To Run

Give bash script executeable permissions: `chmod 755 run.sh`

To run: `.\run.sh <contig file name>`

### Scripts

### Results