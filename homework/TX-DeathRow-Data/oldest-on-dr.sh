row_count=$(cat txdr.html | grep -c "<tr>")
for row in $(seq 2 $row_count)
do
  cat txdr.html | pup "tr:nth-of-type($row)" | \
  tr -d "\n" | grep "12/23/1937"
done
