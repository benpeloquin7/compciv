#################
###Geocoder.sh###
#################

#store addresses (unformatted) in .txt file
touch data-hold/addresses.txt
for file in $(ls data-hold/years-html); do
cat data-hold/years-html/$file | pup 'td[width=198] text{}' >>\
data-hold/addresses.txt
done

#Note about the corrupt address 2120 52 Street from 2009
echo "****There is one corrupt address recorded from data tables from/
2009. Repair this manually****"

#Create a directroy to hold our geocode data
mkdir -p data-hold/geocodes

#Loop through our addresses.txt file
cat data-hold/addresses.txt | while read location; do
file_name=$(echo $location | sed s/[^A-Z0-9]//g)

if [[ -s "data-hold/geocodes/$file_name.json" ]]; then
echo "Already downloaded $file_name.json"
else
echo "geocoding file $filename..."
geocode=$(echo "$location Dallas TX" | tr ' ' '+')
curl -s "https://maps.googleapis.com/maps/api/geocode/json?address=$geocode" >\
data-hold/geocodes/$file_name.json
fi
done
