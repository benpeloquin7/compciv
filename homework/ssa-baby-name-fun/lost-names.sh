path="data-hold/names-nationwide/"
cat $path\yob$1.txt $path\yob$2.txt | cut -d ',' -f 1,2 | sort | uniq -d > tmp.txt
cat $path\yob$1.txt tmp.txt | cut -d ',' -f 1,2 | sort | uniq -u
rm tmp.txt
