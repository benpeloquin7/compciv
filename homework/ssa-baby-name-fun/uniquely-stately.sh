#Searches a given state (var $1) to find unique names
#in a given year (var $2)
filepath="data-hold/names-by-state/"

#Save names from year of interest
cat $filepath$1.TXT | grep -E "[A-Z]{2},[F,M],$2,.+" |
 cut -d ',' -f 2,4 | sort | uniq > yearNames.txt

#Save nonyear names
cat $filepath$1.TXT | grep -vE "[A-Z]{2},[F,M],$2,.+" |
 cut -d ',' -f 2,4 | sort | uniq > nonYearNames.txt

#Locate duplicates between year and nonyears
cat yearNames.txt nonYearNames.txt | sort | uniq -d > dups.txt

#Store unique year names
cat yearNames.txt dups.txt | sort | uniq -u > uniqYearNames.txt
yearNamesNum=$(cat yearNames.txt | wc -l)
dupsNum=$(cat dups.txt | wc -l)

#If we have the same number of names in dups and year names
#there are no uniques so echo 'no uniques'
if [ "$yearNamesNum" -eq "$dupsNum" ]; then
  echo "No unique names in $1 in $2"
else
  #otherwise display the years
  cat uniqYearNames.txt
fi
#cleanup files
rm yearNames.txt nonYearNames.txt dups.txt uniqYearNames.txt
