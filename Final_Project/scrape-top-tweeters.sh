###:------scraper.sh-------:###

#####################
###Data collection###
#####################

mkdir -p cached-accounts

#Curl down top 100 twitter accounts webpage into twittercounter100.html
curl -s -o cached-accounts/twittercounter100.html http://twittercounter.com/pages/100

#Pull out twitter handles store in top100 accounts
cat cached-accounts/twittercounter100.html | pup 'a.uname text{}'\
> cached-accounts/top100_accounts.txt

#Store each of the top 100 in a uniq CSV file
#Account specific data in account-store directory
for account in $(cat cached-accounts/top100_accounts.txt); do
t timeline -n 1000 --csv $account > cached-accounts/$account.csv
#avoid twitter api rate limit, slow api calls to one a minute
sleep 35s
done
