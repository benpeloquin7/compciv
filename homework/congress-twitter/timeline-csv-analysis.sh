###:------timeline-csv-analysis.sh------:###

username=$1

#Output to user
echo "Fetching tweets from $username into ./data-hold/$username\-timeline.csv"

#Fetch tweets
file=data-hold/$username\-timeline.csv
t timeline -n 3200 --csv $username > $file

count=$(csvfix order -f 1 $file | wc -l)
lastdate=$(csvfix order -fn 'Posted at' $file | tail -n 1)

echo "Analyzing $count tweets by $username since $lastdate"

