#!/bin/bash

echo "Please enter the temperature"

read temperature

echo "Is the temperature in Fahrenheit or Celsius ? (F/C)"
read unit

if [ "$unit" = "F" ]; then
  celsius=$(( (temperature - 32) * 5 / 9 ))
  echo "$temperature degrees Fahrenheit is equal to $celsius degrees Celsius."
else
  fahrenheit=$(( temperature * 9 / 5 + 32 ))
  echo "$temperature degrees Celsius is equal to $fahrenheit degrees Fahrenheit."
fi

