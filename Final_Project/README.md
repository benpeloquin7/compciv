###:-----README.md------:###

tweet.as project:

run tweet_as.sh script with a valid twitter @account name argument to generate
tweets that sound as if they were produced by @account. n-gram model 
implemented in n-gram.py script using 5-grams.

###:::------tweet-as.sh-------:::###
main script contains helpers
-> makes cached-accounts dir
-> checks for pre-cached content if user has used tweet-as before

###:::-----tweet-cleaner.sh-------:::###
-> cleans scraped tweets of non-utf characters, removes hyperlinks
-> generates current.txt file used to generate our language model

###:::-----n-grams.py-------:::###
-> simple 5-gram language model using python dictionary data structure
-> requires current.txt file generated by tweet-cleaner.sh
-> generates tweets ~ 120 - 140 characters in length

###:::-----scrape-top-100.sh------:::###
-> scrapes top 100 most followed twitter accounts saving data do 
cached-accounts/ dir
-> cached-accounts comes pre-populated with this account data
for users who may not have t tool installed see:
https://github.com/sferik/t
-> top 100 accounts from http://twittercounter.com/pages/100

###:::--------cached-accounts/--------:::###
-> cached data included with a cloned repo
