####:::--------Scarper.sh------------:::####

#Create data-hold
mkdir data-hold
cd data-hold
#curl OccupationaSeries.xml
curl -o OccupationalSeries.xml\
http://stash.compciv.org/usajobs.gov/OccupationalSeries.xml
#Create scrapes dir
mkdir scrapes

