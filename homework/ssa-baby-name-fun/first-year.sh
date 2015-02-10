###:------------first-year.sh---------------:###
#File to hold names of our over 1k from all years
touch over1k.txt
#File to hold all first occurances of our names
touch first-year.txt

#populate over1k file
for file in data-hold/names-nationwide/*; do
cat $file | grep -E "[0-9]{4,}" | cut -d ',' -f 1,2 >> over1k.txt
done

#Brute force solution - loop through all uniqe names and genders and
#inner loop through all years until we have a year in which we find
#more than 100 instances of a given name
#output to our first-year.txt
for name in $(cat over1k.txt | sort -u | tr -d '\r'); do
year=1880
while [[ $(cat data-hold/names-nationwide/yob$year.txt |
tr -d '\r' | grep -E "$name" | cut -d ',' -f 3) -lt 100 ]]
do
year=$((year+1))
done
name_portion=$(cat data-hold/names-nationwide/yob$year.txt | grep "$name" |
cut -d ',' -f 1,2)
output=$name_portion","$year
echo $output >> first-year.txt
done

cat first-year.txt
#clean-up
rm first-year.txt
rm over1k.txt
