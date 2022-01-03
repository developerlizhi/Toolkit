#!/bin/sh

cd $1

if [ ! -d "$1" ];then
    echo "请输入路径"
    exit 0
fi

if [ -e codec.txt ]; then
	rm codec.txt
fi

for file in $(ls *); do
    if [ -d $file ]; then
        echo "文件夹忽略处理..."
    else
    	suffix=${file##*.}
    	if [[ $suffix = "avi" || $suffix = "mp4" ]]; then
            format_name=$(ffprobe -show_format -select_streams v $file | grep format_name)
            format_long_name=$(ffprobe -show_format -select_streams v $file | grep format_long_name)
    		codec_name=$(ffprobe -show_streams -select_streams v $file | grep codec_name)
            codec_long_name=$(ffprobe -show_streams -select_streams v $file | grep codec_long_name)
            echo $format_long_name
    		echo $file $format_name $format_long_name $codec_name $codec_long_name >> ./codec.txt
        fi
    fi
done