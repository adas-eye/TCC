#! /bin/bash

transform=frame;

ffmpeg -i $1 %05d.png;

for image in $(ls *.png); do
   name=`echo ${image} | cut -d"." -f1`;
   convert frame.jpg ${image} -gravity Center -composite ${name}.png;
   #echo $name;
done

rm -f $2_${transform}.avi;

ffmpeg -r 25 -i %05d.png -q:v 1 $2_${transform}.avi;

rm *.png;
