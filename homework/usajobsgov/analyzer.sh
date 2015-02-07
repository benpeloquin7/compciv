####:::--------Analyzer.sh------------:::####
#Filter only year jobs
yearly_jobs=$(cat data-hold/scraper/$1/*.json |\
jq '. .JobData[] | select(.SalaryBasis == "Per Year")')

#Filter for job title, min and max salary  data
simple_rows=$(echo $yearly_jobs | jq '. | {JobTitle, SalaryMin, SalaryMax}')

#for every line
while read line; do 
#capture title
title=$(echo $line | grep -oE '[[:alpha:]].+')

#pick rows with appr job title
filtered_rows=$(echo $simple_rows | jq "select(.JobTitle == \"$title\")")

#min and max salaries
min=$(echo $filtered_rows | jq -r '.SalaryMin' | tr -d '$' |\
tr -d ',' | sort -n | head -n 1)
max=$(echo $filtered_rows | jq -r '.SalaryMax' | tr -d '$' |\
tr -d ',' | sort -n | head -n 1)

## Get the max on your own
echo $title"|"$min"|"$max
done < <(echo $simple_rows | jq -r '.JobTitle' | sort |\
uniq -c | sort -rn | head -n 25)
