#!/bin/bash

while read rows; do
   echo "project : $rows , ready to clone"
   git clone http://121.4.41.171:3000/developerlizhi/$rows.git
   sleep 3
done < repo.txt
