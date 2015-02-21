###:------scraper.sh-------:###

#initialize data-hold folder if it doesn't exist
mkdir -p data-hold

#our base url for dallas police site
base_url="www.dallaspolice.net/ois/ois"

#Download home page
curl -s -o data-hold/home.html $base_url.html

#extract previous year's data from side bar
urls=$(cat data-hold/home.html | pup 'ul#help a attr{href}' |\
grep -E '[0-9]+' | grep -oE '_.+')

#loop through url years curling html data
for url in $urls; do 
echo "Currently pulling data from $base_url$url"
curl -s -o data-hold/$url $base_url$url
done

base_url="www.dallaspolice.net/ois/"

echo "creating pdfs directory"
mkdir -p pdfs

#Loop through years .html
echo "looping through data-hold..."
for year in $(ls data-hold); do
	#Loop through data tables
	for narrative in $(cat data-hold/$year | pup 'a attr{href}' |\
		grep -E "narrative" | grep -oE 'docs.+'); do
		#Save file name to store pdf
		file_name=$(echo "$narrative" | grep -oE '_.+')
		#curl relevant file
		echo "Pulling narrative from $file_name"
		curl -s -o pdfs/$file_name $base_url$narrative
	done
done
mv pdfs data-hold/pdfs
