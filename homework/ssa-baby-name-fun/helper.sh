#Helper.sh is a helper script to download
#and unpack two zip files for SSA babynames

#Url vars
path_state="http://stash.compciv.org/ssa_baby_names/namesbystate.zip"
path_nation="http://stash.compciv.org/ssa_baby_names/names.zip"

#Make a data-hold director and two sub-directories
mkdir data-hold data-hold/names-by-state data-hold/names-nationwide
cd data-hold

#curl names-by-state
cd names-by-state
curl -o temp1.zip $path_state
unzip temp1.zip
rm temp1.zip

#curl names-nationwide
cd ../names-nationwide
curl -o temp2.zip $path_nation
unzip temp2.zip
rm temp2.zip

#Back to parent directory
cd ../..
