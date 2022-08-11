# define the amino acids
BEGIN{
  c["ATA"]="I"; c["ATC"]="I"; c["ATT"]="I"; c["ATG"]="M";
  c["ACA"]="T"; c["ACC"]="T"; c["ACG"]="T"; c["ACT"]="T";
  c["AAC"]="N"; c["AAT"]="N"; c["AAA"]="K"; c["AAG"]="K";
  c["AGC"]="S"; c["AGT"]="S"; c["AGA"]="R"; c["AGG"]="R";
  c["CTA"]="L"; c["CTC"]="L"; c["CTG"]="L"; c["CTT"]="L";
  c["CCA"]="P"; c["CCC"]="P"; c["CCG"]="P"; c["CCT"]="P";
  c["CAC"]="H"; c["CAT"]="H"; c["CAA"]="Q"; c["CAG"]="Q";
  c["CGA"]="R"; c["CGC"]="R"; c["CGG"]="R"; c["CGT"]="R";
  c["GTA"]="V"; c["GTC"]="V"; c["GTG"]="V"; c["GTT"]="V";
  c["GCA"]="A"; c["GCC"]="A"; c["GCG"]="A"; c["GCT"]="A";
  c["GAC"]="D"; c["GAT"]="D"; c["GAA"]="E"; c["GAG"]="E";
  c["GGA"]="G"; c["GGC"]="G"; c["GGG"]="G"; c["GGT"]="G";
  c["TCA"]="S"; c["TCC"]="S"; c["TCG"]="S"; c["TCT"]="S";
  c["TTC"]="F"; c["TTT"]="F"; c["TTA"]="L"; c["TTG"]="L";
  c["TAC"]="Y"; c["TAT"]="Y"; c["TAA"]="*"; c["TAG"]="*";
  c["TGC"]="C"; c["TGT"]="C"; c["TGA"]="*"; c["TGG"]="W";
}

{
  do {
    # split input into substrings of length 3
    triplet = substr($0, i, 3)
    {
      # if there is no input
      if (c[triplet] == ""){
        # break out of the program
        break
      }
      # otherwise
      else{
        # append the corresponding amino acid to the peptide
        p = p c[triplet]
      }
    }
    # increment our counter by 3
    i += 3
  }
  # while we can read in triplets
  while (triplet != "")
}

# print out the peptides to a text file
{ printf("%s", p) }