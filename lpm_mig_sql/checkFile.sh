#!/bin/bash
file="/home/jzyang/file/1.txt"
if [ -f "$file" ]
then
 echo "$file found."
else
 echo "$file not found."
fi

--�����־
sh portal/main.sh |tee log.txt
