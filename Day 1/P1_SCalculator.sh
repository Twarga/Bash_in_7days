#!/bin/bash


echo "Enter the first number "
read num1

echo "Enter the second number "
read num2

echo "What do you want to do with these numbers?"
echo "1. Add"
echo "2. Substract"
echo "3. Multiply"
echo "4. Divide"

read choice

if [ $choice -eq 1 ]
then
	result=$((num1 + num2))
	echo "The result is : $result "

elif [ $choice -eq 2 ]
then
	result=$((num1 - num2))
	echo "The result is : $result "

elif [ $choice -eq 3 ]
then
	result=$((num1 * num2))
	echo "The result is : $result "

elif [ $choice -eq 4 ]
then
	result=$((num1 / num2))
	echo "The result is : $result "

else
	echo "Invalid choice , somthing wrong :( "

fi

