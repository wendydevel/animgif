gif() {
    convert -delay 10 $gifDir/frame*.png -resize $scale $gifDir/frames.gif
    mv $gifDir/frames.gif $targetDir/$gifName.gif
}

video=$1
targetDir=$2
scale=$3
mkdir $targetDir
ffmpeg -i $video -vf fps=10 $targetDir/frame%05d.png

size=50
fileIndex=0
gifNr=1

for f in $(ls $targetDir/frame*.png)
do
    if [ "$(($fileIndex % $size))" = "0" ] 
    then
        if [ "$fileIndex" -gt "0" ]
        then 
            gif
        fi
        gifName=$(basename $targetDir)-$gifNr
        gifDir=$targetDir/$gifName
        gifNr=$(($gifNr+1))
        mkdir $gifDir        
    fi
    fileNr=$(printf "%05d\n" $((fileIndex+1)))
    mv $targetDir/frame${fileNr}.png $gifDir
    fileIndex=$(($fileIndex+1))
done

if [ "$(($fileIndex % $size))" -gt "0" ]
then
    gif
fi 
