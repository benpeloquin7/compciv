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

#Hashtags
echo "Top 10 hastags by $username"
csvfix lower $file | grep -o "#[a-z|1-9]*" | sort | uniq -c | sort -r | head -n 10

#Retsweeted users
echo "Top 10 retweeted users by $username"
csvfix lower $file |\
grep -o "rt @[a-z|1-9|_]*" | grep -o "@[a-z|1-9]*" |\
sort | uniq -c | sort -r | head -n 10

#Mentioned users (not retweets by user)
echo "Top 10 mentioned users (not including retweets) by $username"
csvfix lower $file |\
grep -v "rt @[a-z|1-9|_]*" | grep -o "@[a-z|1-9]*" | grep -vi "$username" |\
sort | uniq -c | sort -r | head -n 10

#Words (5 chars +)
echo "Top tweeted 10 words with 5+ letters by $username"
csvfix order -f 4 $file | tr '[:upper:]' '[:lower:]' |
grep -ioE "\b[a-z|A-Z]{5,}" | grep -vi "$username" | grep -vi 'http' |\
grep -vi "@" | sort | uniq -c | sort -r | head -n 10
