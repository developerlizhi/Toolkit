#!/bin/bash

if [ -z "$1" ]; then
 echo "未输入MP4视频文件名，结束"
 exit 0
fi

if [ -z "$2" ]; then
 echo "未输入MP4视频文件个数，结束"
 exit 0
fi

echo "MP4文件名为: $1，个数为: $2"

c=concat:
i=1
while (( $i<=$2 ))
do
    if [ ! -e "$1-$i.mp4" ];then
        echo "$1-$i.mp4，文件不存在，停止"
        exit 0
    fi

    c="$c$1-$i.ts|"
    let "i++"
done

c=${c%*|}
echo $c

echo "批量转换MP4视频 -> TS视频 开始"

j=1
while (( $j<=$2 ))
do
    echo "------------------------------------------------------------"
    echo "文件名称：$1-$j.mp4"
    ffmpeg -i $1-$j.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb $1-$j.ts
    echo "------------------------------------------------------------"
    let "j++"
done

echo "批量转换MP4视频 -> TS视频 完成"

echo "合并TS视频 -> MP4视频 开始"
ffmpeg -i "$c" -acodec copy -vcodec copy -absf aac_adtstoasc $1.mp4
echo "合并TS视频 -> MP4视频 完成"

if [ ! -d source ];then
  mkdir source
fi

k=1
while (( $k<=$2 ))
do
    rm $1-$k.ts
    mv $1-$k.mp4 ./source
    let "k++"
done
