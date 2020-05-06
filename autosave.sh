#!/bin/bash
HOMEDIR="/mnt/c/Users/yourname"
SAVEDIR="$HOMEDIR/Pictures/Win10LockPic"

mkdir -p $SAVEDIR
cd $HOMEDIR/AppData/Local/Packages/Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy/LocalState/Assets
find . -mtime -1 -type f -exec cp {} $SAVEDIR \;

cd $SAVEDIR
filelist=`find . -not -name '*jpg' -type f -printf "%f\n"`
for filename in $filelist
do
  size=`identify ./$filename | awk -F " " '{print $3}'`
  mkdir -p ./$size
  mv ./$filename ./$size/$filename.jpg
  if [ $size = "1920x1080" ]; then
    mkdir -p ./3840x2160
    waifu2x-converter-cpp --scale-ratio 2 -m scale -p 0 -i $SAVEDIR/1920x1080/$filename.jpg -o $SAVEDIR/3840x2160/$filename.jpg
  fi
done
