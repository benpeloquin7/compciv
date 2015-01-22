#Writes new .txt file with Top 10 words using Pup and Grep
echo "Top 10 via pup:" > Top10-Pup.txt
cat data-hold/* | pup 'title, p, div.legacy-para text{}' |
grep -oiE '[[:alpha:]]{7,}' | sort | uniq -c | sort -r | head -n 10 >> Top10-Pup.txt
echo "Top 10 via ordinary grep" >> Top10-Pup.txt
cat data-hold/* | grep -ioE '[[:alpha:]]{7,}' | sort | uniq -c | sort -r |
head -n 10 >> Top10-Pup.txt
