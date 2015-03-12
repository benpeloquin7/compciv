###:-----README.md------:###


tweet.as project:

run tweet_as.sh script with a valid twitter @account name argument to generate
tweets that sound as if they were produced by @account. n-gram model 
implemented in n-gram.py script using 4-grams.


Initial cache of twitter profiles pulled from:
http://twittercounter.com/pages/100

#Some code for tweet cleaning and word counting (obama example)
csvfix order -f 4 @BarackObama.csv | grep -v 'RT' |\
tr '[A-Z]' '[a-z]' | tr -d '\?\",\.:()-'| tr ' ' '\n' |\
sort | uniq -c | sort -r | head -n 25

#some n-grams code help in R
http://english.boisestate.edu/johnfry/files/2013/04/bigram-2x2.pdf
