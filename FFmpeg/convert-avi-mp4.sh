#!/bin/sh

if [ -z "$1" ]; then
 echo "未输入MP4视频文件名，结束"
 exit 0
fi

if [ ! -e "$1" ];then
	echo "MP4视频文件不存在，停止"
	exit 0
fi

video_full_name=$1
video_name=${video_full_name%%.*}

bit_rate=$(ffprobe -show_format $1 | grep bit_rate)
bit_rateK=$(expr $(expr ${bit_rate##*=} / 100000) + 1)00k

codec_name=$(ffprobe -show_streams $1 | grep codec_name)
codec_array=($codec_name)
codec=${codec_array[0]##*=}

if test $codec = mpeg4
then
    echo "符合规定格式，开始转换"
    echo "MP4视频文件名：$1，码率：$bit_rateK" 
    ffmpeg -i $1 -b:v $bit_rateK -c:v libx264 $video_name.mp4
else
    echo "不符合规定格式，停止转换"
    exit 0
fi




