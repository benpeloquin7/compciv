###----------------fl-dr.sh----------------###
touch fl-tmp.txt
p="data-hold/"
cat $p\fl1.html $p\fl2.html $p\fl3.html | pup 'td:nth-of-type(3) text{}'\
| grep -vP '\xc2\xa0' | grep -v 'Race' >> fl-tmp.txt

#Output
cat fl-tmp.txt

#Code using a for-loop saving aggregate data into a new file
#touch fl-aggregate.txt
#for page in $(seq 3)
#do
#cat data-hold/fl$page.html | pup 'td:nth-of-type(3) text{}' >> fl-aggregate.txt
#done

