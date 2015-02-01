###:---------helper.sh----------:###

#helper script to curl ssa baby data and extract
#a sample
mkdir -p ./data-hold
cd data-hold
#download file into names.zip
curl -o names.zip http://stash.compciv.org/ssa_baby_names/names.zip
#unzip directly into std out and convert via dow2unix
unzip -p names.zip yob1973.txt yob2013.txt | dos2unix > namesample.txt
#back to home dir
cd ..

