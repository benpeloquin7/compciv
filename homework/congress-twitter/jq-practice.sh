###---------JSON queries for Exploring Congressional Twitter JSON---------###

#Save file paths into vars
pathCurr="data-hold/legislators-current"
pathSoc="data-hold/legislators-social-media"

#Question 1: Print last name of first congressmember
echo "1: "
cat $pathCurr.json | jq '.[0].name.last' | tr -d '"'

#Question 2: Bioguide id of 112th congressmember
echo "2: "
cat $pathCurr.json | jq '.[111].id.bioguide' | tr -d '"'

#Question 3: Start date of the 3rd term of the 14th-listed Congressmember
echo "3: "
cat $pathCurr.json | jq '.[13].terms[2].start' | tr -d '"'

#Question 4: Print first name, last name and the birthdate of the 5th listed congressmember
echo "4: "
cat $pathCurr.json | jq '.[4] | .name.first, .name.last, .bio.birthday' | tr -d '"'

#Question 5: Print the birthdates of the 10 youngest congressmembers
echo "5: "
cat $pathCurr.json | jq '.[].bio.birthday' | tr -d '"' |
 sort -r | head -n 10

#Question 6: Print the list of religious affiliations in descending
#order of frequency
echo "6: "
cat $pathCurr.json | jq '.[].bio.religion' | tr -d '"' |
 sort -n | uniq -c | sort -r 

#Question 7: Print the number of incoming Congressmembers
echo "7: "
cat $pathCurr.json | jq --raw-output '.[].terms[0].start' | cut -d '-' -f 1 | grep -c '2015'

#Question 8: Print the start year of the longest-serving Congressmember
echo "8: "
cat $pathCurr.json | jq --raw-output '.[].terms[0].start' | cut -d '-' -f 1 | sort | head -n 1

#Question 9: Print the number of Republican congressmembers
echo "9: "
cat $pathCurr.json | jq --raw-output '.[].terms[-1:][0].party' | grep -c "Republican"


#Question 10: Print the number of congressmembers who are neither Republican or Democrat
echo "10: "
cat $pathCurr.json | jq --raw-output '.[].terms[-1:][0].party' | grep -cE '\b[^RD][[:alpha:]]+'

#Question 11: get the list of all .rss_url entries, with duplicates removed,
#and in alphabetical order, and print just the first 10 lines
echo "11: "
cat $pathCurr.json | jq --raw-output '.[].terms[].rss_url' | grep -vi 'Null' | 
sort | uniq | head -n 10
