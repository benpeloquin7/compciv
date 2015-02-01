#basic-ifelse.sh

#No arguments
if [[ "$#" -lt 1 ]]; then
  echo "You need more than 0 arguments"
#One argument
elif [[ "$#" -eq 1 ]]; then
  echo "The only argument is $1"
#Two arguments
elif [[ "$#" -eq 2 ]]; then
  echo "There are two arguments: $1 and $2"
  #check for equality between arguments
  if [[ $1 -eq $2 ]]; then
    echo "$1 is equal to $2"
  elif [[ $1 -lt $2 ]]; then
    echo "$1 is less than $2"
  else
    echo "$1 is greater than $2"
  fi
#Three arguments
elif [[ "$#" -eq 3 ]]; then
  echo "There are three arguments: $1, $2, and $3"
  #Var 1 and 2 comparison
  if [[ $1 -eq $2 ]]; then
    str_a="is equal to $2"
  elif [[ $1 -lt $2 ]]; then
    str_a="is less than $2"
  else
    str_a="is greater than $2"
  fi
  #Vars 1 and 3 comparison
  if [[ $1 -eq $3 ]]; then
    str_b="is equal to $3"
  elif [[ $1 -lt $3 ]]; then
    str_b="is less than $3"
  else
    str_b="is greater than $3"
  fi
  #Final output statement
  echo "$1 $str_a and $str_b"
#If we have more than 3 arguments
else
  echo "You need fewer than $# arguments"
fi
