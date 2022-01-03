#!/bin/bash

if [ -d dest ]; then
    rm -rf dest
fi

mkdir dest

echo "批量转换视频格式开始，ts转换为mp4"

for file in $(ls *); do
    if [ -d $file ]; then
        echo "文件夹忽略处理..."
    else
        if [ "${file##*.}" = "ts" ]; then
            fileName="${file%.*}"
            fileSuffix="${file##*.}"
            echo "------------------------------------------------------------"
            echo "文件名称："$fileName
            ffmpeg -i $file -acodec copy -vcodec copy -f mp4 dest/$fileName.mp4
            echo "------------------------------------------------------------"
        fi
    fi
done
echo "批量转换视频完成"
