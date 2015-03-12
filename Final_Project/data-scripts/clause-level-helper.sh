current_file=$1
account_name=$(echo $current_file | grep -oE "@.+" | sed 's/.csv//g')

echo "!"
csvfix order -f 4 $current_file | grep -v 'RT' |\
sed -E 's/http.+\b//g' | sed -E 's/@.+b//g' | iconv -c -f utf-8 -t ascii |\
grep -oiE '[^!\.\?]+(!){1}' | tr -d '\"' > $account_name\1.txt

while read -r line; do
        numTarget=1
        numChars=$(($(echo $line | wc -c) - $(echo $numTarget)))
        numTokens=$(echo $line | wc -w)
        printf '%s|%s|%i|%i|%i\n' "$account_name" "$line" "$numTarget" "$numChars" "$numTokens" >> aggregate.psv
done < $account_name\1.txt
rm $account_name\1.txt

echo "!!"
csvfix order -f 4 $current_file | grep -v 'RT' |\
sed -E 's/http.+\b//g' | sed -E 's/@.+b//g' | iconv -c -f utf-8 -t ascii |\
grep -oiE '[^!\.\?]+(!){2}' | tr -d '\"' > $account_name\2.txt

while read -r line; do
        numTarget=2
        numChars=$(($(echo $line | wc -c) - $(echo $numTarget)))
        numTokens=$(echo $line | wc -w)
        printf '%s|%s|%i|%i|%i\n' "$account_name" "$line" "$numTarget" "$numChars" "$numTokens" >> aggregate.psv
done < $account_name\2.txt
rm $account_name\2.txt

echo "!!!"
csvfix order -f 4 $current_file | grep -v 'RT' |\
sed -E 's/http.+\b//g' | sed -E 's/@.+b//g' | iconv -c -f utf-8 -t ascii |\
grep -oiE '[^!\.\?]+(!){3}' | tr -d '\"' > $account_name\3.txt

while read -r line; do
        numTarget=3
        numChars=$(($(echo $line | wc -c) - $(echo $numTarget)))
        numTokens=$(echo $line | wc -w)
        printf '%s|%s|%i|%i|%i\n' "$account_name" "$line" "$numTarget" "$numChars" "$numTokens" >> aggregate.psv
done < $account_name\3.txt
rm $account_name\3.txt

echo "!!!!"
csvfix order -f 4 $current_file | grep -v 'RT' |\
sed -E 's/http.+\b//g' | sed -E 's/@.+b//g' | iconv -c -f utf-8 -t ascii |\
grep -oiE '[^!\.\?]+(!){4}' | tr -d '\"' > $account_name\4.txt

while read -r line; do
        numTarget=4
        numChars=$(($(echo $line | wc -c) - $(echo $numTarget)))
        numTokens=$(echo $line | wc -w)
        printf '%s|%s|%i|%i|%i\n' "$account_name" "$line" "$numTarget" "$numChars" "$numTokens" >> aggregate.psv
done < $account_name\4.txt
rm $account_name\4.txt

echo "!!!!!"
csvfix order -f 4 $current_file | grep -v 'RT' |\
sed -E 's/http.+\b//g' | sed -E 's/@.+b//g' | iconv -c -f utf-8 -t ascii |\
grep -oiE '[^!\.\?]+(!){5}' | tr -d '\"' > $account_name\5.txt

while read -r line; do
        numTarget=5
        numChars=$(($(echo $line | wc -c) - $(echo $numTarget)))
        numTokens=$(echo $line | wc -w)
        printf '%s|%s|%i|%i|%i\n' "$account_name" "$line" "$numTarget" "$numChars" "$numTokens" >> aggregate.psv
done < $account_name\5.txt
rm $account_name\5.txt

echo "!!!!!!"
csvfix order -f 4 $current_file | grep -v 'RT' |\
sed -E 's/http.+\b//g' | sed -E 's/@.+b//g' | iconv -c -f utf-8 -t ascii |\
grep -oiE '[^!\.\?]+(!){6}' | tr -d '\"' > $account_name\6.txt

while read -r line; do
        numTarget=6
        numChars=$(($(echo $line | wc -c) - $(echo $numTarget)))
        numTokens=$(echo $line | wc -w)
        printf '%s|%s|%i|%i|%i\n' "$account_name" "$line" "$numTarget" "$numChars" "$numTokens" >> aggregate.psv
done < $account_name\6.txt
rm $account_name\6.txt
