#Total number of imates as of 1/22/15
row_count=$(cat txdr.html | grep -c '<tr>')

#Rather than just display the inmate who entered
#at the oldest age I want to save a sorted list of all the inmates
#for future queries
touch inmates.txt

#Process each inmate
for r in $(seq 2 $row_count)
do
  #save received date into var
  rdate=$(cat txdr.html | pup "tr:nth-of-type($r) td:nth-of-type(8) text{}" |\
  cut -d '/' -f 3)
    
  #save birth date into var
  bdate=$(cat txdr.html | pup "tr:nth-of-type($r) td:nth-of-type(5) text{}" |\
  cut -d '/' -f 3)

  #Inmate info
  inmate=$(cat txdr.html | pup "tr:nth-of-type($r) text{}" | tr -d '\n')
   
  #Display age upon received with info
  echo "Entry age: $((rdate-bdate)), Info: $inmate"
done | sort -nr >> inmates.txt
#Sort output and place in new file

#Display first line from new file
cat inmates.txt | head -n 1
