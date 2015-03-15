###:---------tweet-cleaner2.sh-----------:###
#Removes http links, twitter handles, new lines and back slashes

#save file-path and account information
path="cached-accounts/"
account=$1

#rm past cleaned tweets
if [[ -e "$path\current.txt" ]]; then
rm current.txt
fi

#create new cleaned text file --> current.txt for n-grams.py
csvfix order -f 4 $path$account.csv | grep -v "RT" |\
sed -E 's/http.+\b//g' | sed -E 's/@.+\b//g' |\
tr -d '\"' | tr [A-Z] [a-z] | tr '  +' ' ' |\
iconv -c -f utf-8 -t ascii > current.txt
