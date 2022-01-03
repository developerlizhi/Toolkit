#!/bin/sh

for dir in $(ls -d */)
do
  cd $dir
  echo "into $dir"
  if [ -d ".git" ]; then
     output= git push -u origin master
     sleep 3
  cd ..
done
