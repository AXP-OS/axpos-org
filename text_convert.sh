#!/bin/bash

#FILE="$1"
#TEXT=$(cat $FILE)
TEXT="$1"
OUT="$2"

if [ "$#" -ne 2 ];then
    echo "missing arg ($0 <filename> <outputname>)"
    exit 4
fi

FONT_SIZE=40
FONT=DejaVu-Sans

HEIGHT=$(echo "$TEXT" | wc -l)
HEIGHT=$(bc -l <<< "scale=0; $HEIGHT * $FONT_SIZE * 0.6")
WIDTH=0
for line in $(echo "$TEXT"); do
  LINE_WIDTH=$(echo "$line" | wc -c)
  if [ $LINE_WIDTH -gt $WIDTH ]; then
    WIDTH=$LINE_WIDTH
  fi
done
WIDTH=$(bc -l <<< "scale=0; $WIDTH * $FONT_SIZE * 0.2")
#convert -font $FONT -size ${WIDTH}x${HEIGHT} xc:white -pointsize ${FONT_SIZE} -annotate +10+50 "$TEXT" $OUT
#convert -size 2000x500 xc:white -pointsize $FONT_SIZE -font $FONT -annotate +50+50 "$TEXT" $OUT
#convert -size 2000x300 xc:transparent -pointsize $FONT_SIZE -font $FONT -fill grey -stroke grey40 -strokewidth 1.5 -annotate +50+40 "$TEXT" $OUT

convert -size 2000x380 xc:transparent -pointsize  $FONT_SIZE -font $FONT -fill grey -stroke grey40 -strokewidth 1.5 -annotate +50+40 "$TEXT" $OUT
