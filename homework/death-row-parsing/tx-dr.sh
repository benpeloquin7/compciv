###----------------tx-dr.sh----------------###
#Extract race data from tx files
cat data-hold/tx1974-current.html | pup 'td:nth-of-type(7) text{}' > tx1.txt
cat data-hold/tx1923-1973.html | pup 'td:nth-of-type(4) text{}' > tx2.txt
cat tx1.txt tx2.txt

#need to make clean-up script
