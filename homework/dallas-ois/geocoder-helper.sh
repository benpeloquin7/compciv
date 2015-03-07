path="data-hold/geocodes/"


if [[ -e geocodes.psv ]]; then
rm geocodes.psv
fi

touch geocodes.psv
printf 'location|latitude|longitude\n' >> geocodes.psv
for file in $(ls $path); do
	address=$(cat $path$file | jq '.results[0] | .formatted_address' | sed 's/,.*//' | tr -d '"')
        lat=$(cat $path$file | jq '.results[0] | .geometry.location.lat')
        lng=$(cat $path$file | jq '.results[0] | .geometry.location.lng')

        printf '%s|%s|%s\n' "$address" "$lat" "$lng" >> geocodes.psv
done
