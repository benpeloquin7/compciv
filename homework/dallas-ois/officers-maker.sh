#####::::-------officers-maker.sh----------:::::#####


if [[ ! -e tables/incidents.psv ]]; then
echo "Error: no tables/incidents.psv file - re-run table-maker.sh"
elif [[ -e tables/officers.psv ]]; then
echo "Already have tables/officers.psv file - no need to run this script"
else
while read -r line; do
        case_number=$(echo $line | cut -d "|" -f 1)
        date=$(echo $line | cut -d "|" -f 2)
        suspect_killed=$(echo $line | cut -d "|" -f 4)
        if [[ $suspect_killed == "Deceased" ]]; then
                suspect_killed="TRUE"
        else
                suspect_killed="FALSE"
        fi

        suspect_weapon=$(echo $line | cut -d "|" -f 5)

        echo $line | cut -d "|" -f 7 | grep -oE "[A-Z][a-z]+, [A-Z][a-z]+ [A-Z]/[A-Z]\b" > officer_list.txt
        while read -r officer; do
                race=$(echo $officer | grep -oE "[A-Z]/[A-Z]" | cut -d "/" -f 1)
                gender=$(echo $officer | grep -oE "[A-Z]/[A-Z]" | cut -d "/" -f 2)
                first_name=$(echo $officer | cut -d "," -f 1)
                last_name=$(echo $officer | cut -d "," -f 2 | grep -oE "[A-Z][a-z]+")
                printf '%s|%s|%s|%s|%s|%s|%s|%s\n' "$case_number" "$date" "$suspect_killed" "$suspect_weapon" "$last_name" "$first_name" "$race" "$gender" >> tables/officers.psv
        done < officer_list.txt
        rm officer_list.txt
done < tables/incidents.psv
fi

