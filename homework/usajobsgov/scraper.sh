####:::--------Scraper.sh------------:::####
#Assumes we have a directory data-hold

#Check that OccupationalSeries.xml exists in data-hold
cd data-hold
#Check that we have OccupationalSeries.xml
if [[ ! -e "OccupationalSeries.xml" ]]; then
curl -o OccupationalSeries.xml\
 http://stash.compciv.org/usajobs.gov/OccupationalSeries.xml
fi

#Check that we have scraper directory
if [[ ! -d "scraper" ]]; then
mkdir scraper
fi

#Create new time-steamp dir in scraper and navigate inside
cd scraper
currTime=$(bash ../../time.sh)
mkdir $currTime
cd $currTime

#Save a file with all job families
all_Job_Families=$(cat ../../OccupationalSeries.xml |\
hxselect -c 'JobFamily' -s ',' | sed s/,/\\n/g)

#Curl down all pages
path=https://data.usajobs.gov/api/jobs?

#Outer loop through all job families
for jobfam in $all_Job_Families; do
#curl page number
pages=$(curl $path"series="$jobfam | jq '. | .Pages')
#remove whatever non-int char exists there
pages=$(echo $pages | sed 's/[^0-9]*//g')
#inner loop through pages
for nPage in $(seq 1 $pages); do
curl -o $jobfam"-"$nPage".json" $path"series="$jobfam"&Page="$nPage
done
done
