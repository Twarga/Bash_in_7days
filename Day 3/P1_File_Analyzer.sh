#!/bin/bash

Directory="logfiles"

for file in $Directory/*
do
	if [ -f $file ];then
		file_type=$(file -b $file)
		file_Size=$(stat -c%s $file)
		
		echo "File Name $file"
		echo "File Type $file"
		echo "File Size $file"
	fi
done

