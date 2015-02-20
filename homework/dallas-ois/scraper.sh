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
curl -s -o data-hold/$url $base_url\$url
done
