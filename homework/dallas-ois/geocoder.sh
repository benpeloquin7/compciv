#################
###Geocoder.sh###
#################

#store addresses (unformatted) in .txt file
touch data-hold/addresses.txt
for file in $(ls data-hold/years-html); do
cat data-hold/years-html/$file | pup 'td[width=198] text{}' >>\
data-hold/addresses.txt
done
