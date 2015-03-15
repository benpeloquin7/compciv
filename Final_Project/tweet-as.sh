###:------------tweet-as script-----------:###
#user entered account
account=$1

mkdir -p cached-accounts
exists=$(ls cached-accounts/ | grep -E "$account" | tr -d "@" | sed 's/\.csv//g')

#If we don't have cached data
if [[ -z "$exists" ]]; then
        echo "No pre-cached tweets for $account. Scraping tweets now..."
        #scrape last 1000 tweets from @account and save to cached-accounts
        t timeline -n 1000 --csv $account > cached-accounts/$account.csv
fi

#tweet-cleaner script for n-gram model -- outputs current.txt
bash tweet-cleaner.sh $account

if [[ -e "current.txt" ]]; then
        echo -e "Generating tweet as $account:\n"
        output=$(python n-grams.py)
        echo $output | sed 's/[\.!?]\s*./\U&\E/g'
	echo -e "\n"
else
        echo "error occurred..."
fi
