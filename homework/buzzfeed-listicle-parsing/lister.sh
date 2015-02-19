###:------lister.sh--------:###
#Iterates through scraped buzzfeed data
#pulls out list headlines and tallys lister sizes

d_start='2014-01-01'
d_end='2014-12-31'
days_diff=$(( ( $(date -ud $d_end +'%s') - $(date -ud $d_start +'%s' ) )\
	/ 60 / 60 / 24 ))

for num in $(seq 0 $days_diff); do
#store vars for file path
day=$(date -d "$d_start $num days" +%d)
month=$(date -d "$d_start $num days" +%m)

#Save current file path
current_path="data-hold/2014/$month/$day.html"

#parse for healines and nums
nums="$nums $(cat $current_path | pup 'a text{}' |\
grep -E '[1-9]{1,2}[ ][A-Z]+' | grep -oE '[0-9]+' |\
grep -vE '[0-9]{3,4}')"

#echo $(date -ud "$d_start $num days" +%Y-%m-%d)
done

file_name=$(date -d "$d_start $num days" +%Y)

if [ -e "$filename.csv" ]
then
rm $filename.csv
else
echo $nums | tr " " "\n" | sort | uniq -c | sort -r |\
sed -e 's/^[ \t]*//' | sed 's/ \([0-9]\)/,\1/g' >\
$file_name.csv
fi

#Display file contents in terminal
cat $file_name.csv

#Run rscript for plotting
Rscript r_graph.r

#For an example of this plot please visit
#web.stanford.edu/~<stanford_user_name>/listicles_plot.jpeg
mv listicles_plot.jpeg ~/WWW/listicles_plot.jpeg
