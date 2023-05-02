#!/bin/bash

# -f is test the exsitance of a file 
# -d for test the existence of directory
test=/etc 
while [ -d $test]
do
	echo "The test file exists. "
done

echo "The file no longer exist"
