#assumes we are in directory in which we'd like to store "data-hold" dir
mkdir data-hold
cd data-hold
curl -s http://stash.compciv.org/wh/wh-press-briefings-2015-01-07.zip \
-o briefings.zip
unzip briefings.zip
mv wh-briefings/* .
rm briefings.zip
rmdir wh-briefings/
cd ..

