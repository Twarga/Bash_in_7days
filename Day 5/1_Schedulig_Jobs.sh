#!/bin/bash

# in this tutorial we use at tool
# How to use at tool 
# syntax >> at <time and date > -f ./the scirpt
# to see the jobs queue use atq 
# to cancel a job we use atrm + job id
 

logfile=job_results.log

echo "The script ran at the following time: $(date)" > $logfile

