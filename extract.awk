# for every line that isnt the first one put it into the output file without formatting
# i.e. no new line
NR > 1 { printf > "extract.txt" }