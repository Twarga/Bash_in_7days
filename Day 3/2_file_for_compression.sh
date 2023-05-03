#!/bin/bash

# look in logfiles directory and compressed any file in it. 
for file in logfiles/*.log
do
	tar -czvf $file.tar.gz $file
done

