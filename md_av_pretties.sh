#!/bin/sh

curl http://ja.wikipedia.org/wiki/AV%E5%A5%B3%E5%84%AA%E4%B8%80%E8%A6%A7 > /tmp/av_pretties.html

work_dir=~/grass_mud_horse_av

if [ -d ${work_dir} ]
then
    rm -rf ${work_dir}
fi

mkdir ${work_dir}
cd ${work_dir}

for pretty in `cat /tmp/av_pretties.html | grep -E '<li><a.+?>.+</a>.+</li>' | sed -r 's/<li><a.+>(.+?)<\/a>.+<\/li>/\1/' | sort | uniq`
do
    echo creating $pretty...
    mkdir $pretty
done

