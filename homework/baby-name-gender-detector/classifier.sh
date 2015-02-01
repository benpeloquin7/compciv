###:---------classifier.sh----------:###

#This script is conditional on prior use of helper.sh
#to create file below
datafile='data-hold/namesample.txt'

name=Jessie

#Match every line with $name
name_matches=$(cat $datafile | grep "$name,")

#Gender count vars
m_count=0
f_count=0

for row in $name_matches; do
  #Save the baby count 
  babies=$(echo $row | cut -d ',' -f 3)

  #Check for gender and add to appropriate var
  if [[ $row =~ ',M,' ]]; then
    m_count=$((m_count + babies))
  else
    f_count=$((f_count + babies))
  fi
done

#Total all babies with name $name
total_babies=$((m_count + f_count))

#Check that we have at least one baby with $name
if [[ $total_babies -eq 0 ]]; then
  g_and_pct="NA,0"
else
  pct_female=$((100 * f_count / total_babies))
  
  if [[ pct_female -ge 50 ]]; then
    g_and_pct="F,$pct_female"
  else
   g_and_pct="M,$((100 - $pct_female))"
  fi
fi

echo "$name,$g_and_pct,$total_babies"
