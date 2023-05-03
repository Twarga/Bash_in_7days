#!/bin/bash
# we use {first value..last value}
for n in {1..10}
do
	echo $n
	sleep 1
done

echo "This is outside of the loop. "
