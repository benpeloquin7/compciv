###:::---------table-maker.sh----------:::###


##########:::incidents.psv:::##########
if [[ -e incidents.csv ]]; then
rm incident1.csv
fi
touch incident1.csv
#printf 'case_number|date|location|suspect_status|suspect_weapon|suspects|officers|grand_jury|latitude|longitude|narrative' >> incidents.psv

for year in $(ls data-hold/years-html/*); do
if [[ $(echo $year | grep -oE 'home') == "home" ]]; then
	file_name="home";
else
	file_name=$(echo $year | awk -F "_" '{print $2}' | tr -d "\.html");
fi
cat $year | pup 'table table tr json{}' |\
jq  --raw-output '.[] .children | [ 
.[0] .children[0] .text, 
.[1] .text,
.[2] .text,
.[3] .text,
.[4] .text,
.[5] .text,
.[6] .text,
.[7] .text
] | @csv' >> incident1.csv
done

csvfix echo -smq -osep '|' incident1.csv > incident2.psv

###incident2.psv###
if [[ -e incident3.psv ]]; then
rm incident3.psv
fi
touch incident3.psv

cat incident2.psv | while read line; do
	incident=$(echo $line | cut -d "|" -f 1)
	pdf_file=$(ls data-hold/pdfs/* | grep -E "$incident")
	pdftotext -layout "$pdf_file" "${pdf_file/%.pdf/.txt}"
#	pdftotext "$pdf_file"
	txt_file=$(ls data-hold/pdfs/ | grep "$incident" | grep ".txt")
	txt=$(cat $txt_file)
	line="$line|$txt\n"
	echo $line >> incident3.psv
done
