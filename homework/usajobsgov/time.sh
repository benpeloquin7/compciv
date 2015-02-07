date=$(date +%Y-%m-%d)
hour=$(date +%H)

if [[ $hour -lt 10 ]]; then
  hour="0"$hour"00"
else
  hour=$hour"00"
fi

date+=_$hour

echo $date
