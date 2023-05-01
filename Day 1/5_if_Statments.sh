#!/bin/bash

mynum=500
# -gt = greater than , eq = equal  
# we use ! before the statment to reverse it 
if [ ! $mynum -eq 200 ]
then
	echo "The condition is true"
else
	echo "The variable does not equal 200" 
fi
