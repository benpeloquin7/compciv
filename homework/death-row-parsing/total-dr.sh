###----------------total-dr.sh----------------###
#Aggregate file to hold all data
touch total.txt

#Texas-->
for line in $(bash tx-dr.sh)
do
echo "TX,$line" >> total.txt
done
rm tx1.txt tx2.txt

#FL DATA-->
for line in $(bash fl-dr.sh)
do
echo "FL,$line" |\
#W --> WHITE
sed 's/W/White/'|\
#B --> BLACK
sed 's/B/Black/' |\
#H --> HISPANIC
sed 's/H/Hispanic/'|\
#O --> OTHER
sed 's/O/Other/'|\
#Erase M,F
sed 's/M//' | sed 's/F\b//' >> total.txt
done
rm fl-tmp.txt

#CA DATA -->
for line in $(bash ca-dr.sh)
do
#CA prefix
echo "CA,$line" |\
#WHI --> White
sed 's/WHI/White/' |\
#BLA --> Black
sed 's/BLA/Black/' |\
#HIS --> Hispanic
sed 's/HIS/Hispanic/' |\
#OTH --> Other
sed 's/OTH/Other/' >> total.txt
done
