# define the compliment of each base
BEGIN{
  label["A"]="T"
  label["C"]="G"
  label["G"]="C"
  label["T"]="A"
}

{
  # split all the characters in the 0th field into an array
  num = split($0, array, "")
  # for each value in the array
  for (k=1; k <= num; k++){
    # if the value is in the definitions of each base
    if (array[k] in label){
      # swap it with the specified compliment and concatenate
      val = label[array[k]] val
    }
  }
  # set the 0th field to be the array
  $0 = val
}

# print the string to a file
{ print }