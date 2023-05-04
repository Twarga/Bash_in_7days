#!/bin/bash

# this script make an update to your system depend in your linux distro that you use arch /debian base

# as always -d check the existance of a directory

release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=var/log/updater_errors.log

check_exit_status() {
	if [ $? -ne 0 ]
	then
		echo "An error occurredm please check the $errorlog file ."
	fi
}
if grep -q "Arch" $release_file
then
	# The Host is based on Arch, run the pacman update command
	sudo pacman -Syu 1>>$logfile 2>>$errorlog
	check_exit_status
fi



if grep -q "Pop" $release_file || grep -q "Ubuntu" $release_file
then
	# The Host is based on Debian or Ubuntu 
	# Run the apt version of the command 
	sudo apt update 1>>$logfile 2>>$errorlog
	check_exit_status
	sudo apt dist-upgrade -y 1>> $logfile 2>>$errorlog
	check_exit_status

fi
