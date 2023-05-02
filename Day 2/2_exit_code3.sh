#!/bin/bash

# this script check if the direcorty we given  it's existe or not
# you can test the else system by change the name of the directory used as an example 
directory=/day


if [ -d $directory ]
then
	echo "the directory $directory exist "
else
	echo "The directory doesn't exist "
fi

echo "the exit code of this script is : $? "
