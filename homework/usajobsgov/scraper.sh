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

#Create new time-steamp dir in scraper
cd scraper
currTime=$(bash ../../time.sh)
mkdir $currTime
