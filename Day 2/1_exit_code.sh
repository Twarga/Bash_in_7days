#!/bin/bash

# to test the else statment you can change the value of the variable package 

package=nothing

sudo apt install $package >> package_install_results.log


if [ $? -eq 0 ]
then
	echo "The command run succefuly"
	echo "The new command is available here :"
	which $package
else
	echo "The command failed" >> failure.log
fi
