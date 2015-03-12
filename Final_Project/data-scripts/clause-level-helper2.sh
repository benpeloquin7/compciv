current_file=$1
account_name=$(echo $current_file | grep -oE "@.+" | sed 's/.csv//g')

for num in {1..6}; do
echo $num
csvfix order -f 4 $current_file | grep -v 'RT' |\
sed -E 's/http.+\b//g' | sed -E 's/@.+b//g' | iconv -c -f utf-8 -t ascii |\
grep -oiE "[^!\.\?]+(!){$num}" | tr -d '\"' | tr -d '|' > $account_name$num.txt

while read -r line; do
        numTarget=$num
        numChars=$(($(echo $line | wc -c) - $(echo $numTarget)))
        numTokens=$(echo $line | wc -w)
        printf '%s|%s|%i|%i|%i\n' "$account_name" "$line" "$numTarget" "$numChars" "$numTokens" >> aggregate.psv
done < $account_name$num.txt
rm $account_name$num.txt
done
